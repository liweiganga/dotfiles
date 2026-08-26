-- Catppuccin Mocha 配色方案
-- 参考: https://catppuccin.com/palette
return {
    foreground = '#cdd6f4',
    background = '#1e1e2e',
    cursor_bg = '#f5e0dc',
    cursor_border = '#f5e0dc',
    cursor_fg = '#1e1e2e',
    selection_bg = '#585b70',
    selection_fg = '#cdd6f4',

    ansi = {
        '#45475a', -- black
        '#f38ba8', -- red
        '#a6e3a1', -- green
        '#f9e2af', -- yellow
        '#89b4fa', -- blue
        '#f5c2e7', -- magenta
        '#94e2d5', -- cyan
        '#bac2de', -- white
    },
    brights = {
        '#585b70', -- black
        '#f38ba8', -- red
        '#a6e3a1', -- green
        '#f9e2af', -- yellow
        '#89b4fa', -- blue
        '#f5c2e7', -- magenta
        '#94e2d5', -- cyan
        '#a6adc8', -- white
    },

    -- 标签栏配色（字段名必须为 bg_color / fg_color）
    tab_bar = {
        active_tab = { bg_color = '#cba6f7', fg_color = '#1e1e2e', intensity = 'Bold' },
        inactive_tab = { bg_color = '#181825', fg_color = '#cdd6f4' },
        inactive_tab_hover = { bg_color = '#313244', fg_color = '#cdd6f4' },
        new_tab = { bg_color = '#313244', fg_color = '#cdd6f4' },
        new_tab_hover = { bg_color = '#45475a', fg_color = '#cdd6f4' },
    },
}
