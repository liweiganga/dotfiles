-- lua_ls(Lua Language Server)
-- `mason` 字段是本仓库自定义约定:init.lua 据此去 mason-registry 查包名并按需安装。
---@type vim.lsp.Config
return {
    mason = 'lua-language-server',
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
                checkWorkspacePath = false,
                -- 让 lua_ls 认识 nvim 的 runtime,这样 vim.api / vim.fn 等有补全与类型
                library = vim.api.nvim_get_runtime_file('', true),
            },
            -- 声明全局变量,避免误报 undefined
            diagnostics = { globals = { 'vim' } },
            telemetry = { enable = false },
        },
    },
}
