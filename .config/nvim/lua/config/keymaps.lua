-- Modes
--    normal_mode = "n",
--    insert_mode = "i",
--    visual_mode = "v",
--    visual_block_mode = "x",
--    term_mode = "t",
--    command_mode = "c",
--    CR == 回车
--    <C-w>h == ctrl+w h
local G = require("utils.keymap")

G.bulk_register({
    {
        mode = { "n" },
        lhs = "<leader><esc>",
        rhs = ":qa<CR>",
        options = { silent = true },
        description = "ESC neovim",
    },
    {
        mode = { "n" },
        lhs = "<C-u>",
        rhs = function()
            vim.cmd("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "k")
        end,
        options = { noremap = true, silent = false },
        description = "move 1/4 screen up",
    },
    {
        mode = { "n" },
        lhs = "<C-d>",
        rhs = function()
            vim.cmd("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "j")
        end,
        options = { noremap = true, silent = false },
        description = "move 1/4 screen down",
    },
    {
        mode = { "n", "v" },
        lhs = "/", rhs = "/\\v",
        options = { noremap = true, silent = false },
        description = "magic search",
    },
    {
        mode = { "n" },
        lhs = "k",
        rhs = function()
            return vim.v.count > 0 and "k" or "gk"
        end,
        options = { expr = true, silent = false },
        description = "move up one line",
    },
    {
        mode = { "n" },
        lhs = "j",
        rhs = function()
            return vim.v.count > 0 and "j" or "gj"
        end,
        options = { expr = true, silent = false },
        description = "move down one line",
    },
})
