-- LSP 诊断显示与通用 capabilities
local M = {}

function M.setup()
    vim.diagnostic.config({
        virtual_text = {
            prefix = '●',
            spacing = 4,
        },
        signs = true,
        underline = true,
        update_in_insert = false, -- 插入时不刷新,避免输入卡顿
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
    })

    -- 诊断跳转键位(全局,适用于所有 buffer)
    vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = '下一处诊断' })
    vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = '上一处诊断' })
    vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = '诊断列表(LOC)' })
end

-- 拼装 LSP capabilities:基础能力 + blink.cmp 的补全能力。
-- blink 在 InsertEnter 才加载,这里用 pcall 兜底(补全未就绪时退化为基础能力)。
function M.capabilities()
    local caps = vim.lsp.protocol.make_client_capabilities()
    local ok, blink = pcall(require, 'blink.cmp')
    if ok and blink and blink.get_lsp_capabilities then
        caps = vim.tbl_deep_extend('force', caps, blink.get_lsp_capabilities())
    end
    return caps
end

return M
