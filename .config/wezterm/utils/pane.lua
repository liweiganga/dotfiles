-- 窗格相关工具函数
local wezterm = require('wezterm')
local M = {}

---判断当前 pane 前台进程是否为 vim/nvim
---可用于让 hjkl 在 vim 内透传、vim 外切 pane
---@param pane Pane
---@return boolean
function M.is_vim(pane)
    local name = pane:get_foreground_process_name()
    return name:match('n?vim') ~= nil
end

---获取当前 pane 的简短标题（进程名）
---@param pane Pane
---@return string
function M.short_title(pane)
    local name = pane:get_foreground_process_name() or ''
    return name:gsub('%.exe$', '')
end

return M
