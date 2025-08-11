local wezterm = require('wezterm')

local font_family = 'JetBrainsMonoNL Nerd Font'
local font_size = 15

return {
    font = wezterm.font_with_fallback {
        { family = font_family, weight = 'Medium' },
        'Noto Sans CJK SC',
        'WenQuanYi Micro Hei Mono',
    },
    font_size = font_size,
}
