return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false, -- 高亮属于基础体验,随启动就绪,不懒加载
    config = function()
        -- 新版(main 分支)是一次完全重写,setup 仅负责指定 parser 安装目录;
        -- 旧的 highlight / indent / ensure_installed / auto_install 字段已不存在,
        -- 高亮改由 Neovim 原生 vim.treesitter 提供。
        require('nvim-treesitter').setup {
            install_dir = vim.fn.stdpath('data') .. '/site',
        }

        -- 希望开箱即用的语言 parser 列表
        -- markdown_inline 是 render-markdown.nvim 渲染链接/checkbox 等行内元素所必需
        local ensure_installed = {
            'bash', 'c', 'cpp', 'css', 'html', 'javascript', 'json',
            'lua', 'markdown', 'markdown_inline', 'python', 'rust',
            'toml', 'vim', 'vimdoc', 'yaml',
        }

        -- 启动后异步补装缺失的 parser(已装会自动跳过),不阻塞 UI
        vim.defer_fn(function()
            local installed = require('nvim-treesitter').get_installed()
            local missing = vim.tbl_filter(function(lang)
                return not vim.list_contains(installed, lang)
            end, ensure_installed)
            if #missing > 0 then
                require('nvim-treesitter').install(missing)
            end
        end, 0)

        -- 高亮:对存在 parser 的文件类型启动 treesitter 高亮
        vim.api.nvim_create_autocmd('FileType', {
            group = vim.api.nvim_create_augroup('treesitter_highlight', { clear = true }),
            callback = function(args)
                local ok, parser = pcall(vim.treesitter.get_parser, args.buf)
                if ok and parser then
                    pcall(vim.treesitter.start, args.buf)
                end
            end,
        })

        -- 基于 treesitter 的代码折叠(foldlevel=99:打开文件时默认全部展开)
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.opt.foldlevel = 99
    end,
}
