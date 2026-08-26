-- LSP 入口:注册各 server 配置 + 按 filetype 自动安装缺失的 server + LspAttach 键位
--
-- 职责切分(见 :help lspconfig 与 mason-lspconfig 源码):
--   - 本文件:用 vim.lsp.config() 注册 per-server 配置;FileType autocmd 检测未装则触发安装。
--   - mason-lspconfig.automatic_enable:已装的立即 vim.lsp.enable();会话中新装的由其
--     package:install:success 事件处理器自动 enable。因此本文件只管"装",不手动 enable。
local M = {}

local servers_dir = vim.fn.stdpath('config') .. '/lua/lsp/servers'

-- filetype -> 该 filetype 期望启用的 server 列表 { {lsp=, mason=} }
local ft_map = {}
-- 记录正在安装中的 mason 包,避免对同一包并发重复触发
local installing = {}

-- 读取 lua/lsp/servers/*.lua,逐个 vim.lsp.config 注册,并建立 ft -> server 映射
local function register_servers()
    local config = require('lsp.config')
    local caps = config.capabilities()

    local files = vim.fn.glob(servers_dir .. '/*.lua', false, true)
    for _, file in ipairs(files) do
        local modname = 'lsp.servers.' .. vim.fn.fnamemodify(file, ':t:r')
        local ok, cfg = pcall(require, modname)
        if not ok or type(cfg) ~= 'table' then
            vim.notify(('LSP: 跳过 %s: %s'):format(modname, tostring(cfg)), vim.log.levels.WARN)
            goto continue
        end

        local mason_pkg = cfg.mason
        cfg.mason = nil -- mason 字段是我们自定义的约定,非 vim.lsp.Config 合法字段,注册前移除

        -- 注入通用 capabilities(补全/诊断等),server 自带的优先合并
        cfg.capabilities = vim.tbl_deep_extend('force', caps, cfg.capabilities or {})

        local name = vim.fn.fnamemodify(file, ':t:r')
        vim.lsp.config(name, cfg)

        for _, ft in ipairs(cfg.filetypes or {}) do
            ft_map[ft] = ft_map[ft] or {}
            table.insert(ft_map[ft], { lsp = name, mason = mason_pkg })
        end

        ::continue::
    end
end

-- 触发 mason 安装指定包(若尚未安装)。安装完成后由 mason-lspconfig 自动 enable。
local function ensure_installed(pkg)
    if not pkg or installing[pkg] then return end
    local ok, registry = pcall(require, 'mason-registry')
    if not ok or not registry then return end

    -- refresh 是幂等的:registry 已是最新时回调立即执行;未刷新时异步刷新后回调
    pcall(registry.refresh, function()
        if installing[pkg] then return end
        local installed = false
        pcall(function()
            installed = registry.is_installed(pkg)
        end)
        if installed then return end

        installing[pkg] = true
        vim.notify(('LSP: 正在后台安装 %s …'):format(pkg), vim.log.levels.INFO)

        local pok, p = pcall(registry.get_package, pkg)
        if not pok or not p then
            installing[pkg] = nil
            vim.notify(('LSP: 在 mason 注册表中找不到 %s'):format(pkg), vim.log.levels.ERROR)
            return
        end
        -- 安装结束(成功或失败)后解除去重锁,允许后续重试
        pcall(function() p:once('closed', function() installing[pkg] = nil end) end)
        pcall(p.install, p)
    end)
end

local function register_autocmds()
    local group = vim.api.nvim_create_augroup('lsp_user_setup', { clear = true })

    -- 打开文件时按 filetype 自动补装缺失的 LSP server
    vim.api.nvim_create_autocmd('FileType', {
        group = group,
        callback = function(args)
            local servers = ft_map[args.match]
            if not servers then return end
            for _, s in ipairs(servers) do
                ensure_installed(s.mason)
            end
        end,
    })

    -- LSP 真正 attach 到 buffer 时再设 buffer-local 键位
    vim.api.nvim_create_autocmd('LspAttach', {
        group = group,
        callback = function(args)
            require('lsp.keymaps').attach(args.buf)
        end,
    })
end

function M.setup()
    register_servers()
    register_autocmds()
end

return M
