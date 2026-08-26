-- LSP buffer-local 键位
-- 仅在 LSP 真正 attach 到 buffer 时设置,避免无 LSP 的 buffer 报错。
-- nvim 0.12 已内置默认 LSP keymaps(gd/grr/gra/gri/gO 等),这里只补充 leader 系列。
local M = {}

local function map(buf, mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = buf, silent = true, desc = desc })
end

function M.attach(buf)
    map(buf, 'n', 'K', vim.lsp.buf.hover, 'LSP: 悬浮文档')
    map(buf, { 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'LSP: code action')
    map(buf, 'n', '<leader>rn', vim.lsp.buf.rename, 'LSP: 重命名')
    map(buf, 'n', '<leader>df', function() vim.lsp.buf.format({ bufnr = buf }) end, 'LSP: 格式化(buffer)')
end

return M
