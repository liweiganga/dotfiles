-- 右下角状态栏：显示当前时间
-- 注册即生效（wezterm.on 为全局副作用）
local wezterm = require('wezterm')

wezterm.on('update-right-status', function(window, pane)
    window:set_right_status(wezterm.format({
        { Foreground = { Color = '#bd93f9' } },
        { Text = wezterm.strftime(' %H:%M:%S ') },
    }))
end)
