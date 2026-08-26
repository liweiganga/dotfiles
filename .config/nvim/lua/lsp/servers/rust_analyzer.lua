-- rust_analyzer(Rust)
---@type vim.lsp.Config
return {
    mason = 'rust-analyzer',
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml', 'rust-project.json', '.git' },
    settings = {
        ['rust-analyzer'] = {
            cargo = { allFeatures = true, loadOutDirsFromCheck = true, buildScripts = { enable = true } },
            checkOnSave = { command = 'clippy', extraArgs = { '--no-deps' } },
            inlayHints = { chainingHints = true, closureCaptureHints = true },
        },
    },
}
