return {
    'MeanderingProgrammer/render-markdown.nvim',
    -- lazy.nvim 懒加载触发器:打开 markdown 文件时才加载插件本体。
    -- 注意:opts.file_types 是插件运行时配置(控制 attach 哪些 filetype),与这里的 ft 无关,
    -- 两者必须都设,否则在 defaults={lazy=true} 下插件永远不会被加载。
    ft = { 'markdown' },
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-mini/mini.nvim',
        'nvim-tree/nvim-web-devicons'
    },            -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        file_types = {
            'markdown',
        },
        render_modes = true,
    },
}
