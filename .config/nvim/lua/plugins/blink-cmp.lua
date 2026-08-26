-- blink.cmp:现代补全引擎(Rust fuzzy matcher)
-- snippets 用 default preset(blink 自带引擎 + friendly-snippets),不引入 LuaSnip。
return {
    'saghen/blink.cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    version = '1.*',
    dependencies = {
        'saghen/blink.lib',
        'rafamadriz/friendly-snippets',
    },
    -- release tag 默认下预编译二进制;无二进制时用 cargo(已装)现场编译
    build = function()
        require('blink.cmp').build():pwait()
    end,
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = 'default' }, -- C-y 接受 / C-n,C-p 选择 / C-space 触发 / C-k signature
        sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
        snippets = { preset = 'default' },
        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 500 },
        },
        signature = { enabled = true },
        fuzzy = { implementation = 'rust' },
    },
    opts_extend = { 'sources.default' },
}
