-- clangd(C/C++)
---@type vim.lsp.Config
return {
    mason = 'clangd',
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    root_markers = { 'compile_commands.json', 'compile_flags.txt', '.clangd', '.clang-tidy', '.clang-format', '.git' },
    cmd = { 'clangd', '--background-index', '--clang-tidy', '--header-insertion=iwyu' },
}
