-- mason.nvim + mason-lspconfig.nvim + nvim-lspconfig 三合一
--
-- setup 顺序(mason-lspconfig 文档要求):mason.nvim 已 setup → nvim-lspconfig 在 rtp → mason-lspconfig.setup。
-- 我们在 mason-lspconfig.setup **之前**先 require('lsp').setup(),把自定义 vim.lsp.config 注册到位,
-- 这样 automatic_enable 对已装 server 调 vim.lsp.enable 时能带上我们的配置。
local SERVERS = { 'lua_ls', 'clangd', 'pyright', 'rust_analyzer', 'bashls' }

return {
    {
        'mason-org/mason.nvim',
        lazy = false, -- mason 不建议延迟 setup
        opts = {
            ui = { border = 'rounded' },
        },
    },
    {
        'mason-org/mason-lspconfig.nvim',
        lazy = false,
        dependencies = {
            'mason-org/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        opts = {
            ensure_installed = SERVERS, -- 首次启动自动下载核心语言集
            automatic_enable = true,    -- 已装的立即 enable;会话中新装的由 package:install:success 自动 enable
        },
        config = function(_, opts)
            -- 1) 先注册我们的 per-server 配置与自动安装 autocmd
            require('lsp').setup()
            -- 2) 再 setup mason-lspconfig:触发 ensure_installed 下载 + automatic_enable.enable_all
            require('mason-lspconfig').setup(opts)
        end,
    },
}
