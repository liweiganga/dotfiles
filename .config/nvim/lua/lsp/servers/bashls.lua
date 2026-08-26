-- bashls(Bash)
---@type vim.lsp.Config
return {
    mason = 'bash-language-server',
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'bash', 'sh', 'zsh' },
    root_markers = { '.git', '.bashrc', '.bash_profile' },
    settings = {
        bashIde = {
            -- shellcheck 可执行路径,若系统装了 shellcheck 则开启 lint
            shellcheckPath = vim.fn.executable('shellcheck') == 1 and 'shellcheck' or '',
            enableSourceQuotes = false,
        },
    },
}
