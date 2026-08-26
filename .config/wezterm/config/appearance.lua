local wezterm = require('wezterm')

return {
    -- cursor
    default_cursor_style = 'BlinkingBlock',
    cursor_blink_rate = 500,
    force_reverse_video_cursor = true,
    -- color
    -- color_scheme = 'GruvboxDark',
    color_scheme = 'Dracula',
    -- 自定义配色方案（colors/ 目录），切换主题改这一行
    color_schemes = {
        ['Catppuccin Mocha'] = require('colors.catppuccin_mocha'),
    },
    -- background
    -- scrollbar
    enable_scroll_bar = true,
    -- tab_bar
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = true,
    tab_max_width = 25,
    tab_bar_at_bottom = true,
    show_tab_index_in_tab_bar = false,
    switch_to_last_active_tab_when_closing_tab = true,
    -- window padding
    window_padding = {
        left = 2,
        right = 1,
        top = 2,
        bottom = 0,
    },
    -- window title
    window_decorations = 'NONE',
    -- opacity
    text_background_opacity = 1.0,
    window_background_opacity = 1.0,
    -- status update time(ms)
    status_update_interval = 1000,
    -- scrollback
    scrollback_lines = 99999,
    -- close bar
    window_frame = {
        font_size = 13.0,
        active_titlebar_bg = '#1e1e2e',
        inactive_titlebar_bg = '#181825',
    },
    -- exit
    window_close_confirmation = 'AlwaysPrompt',
}
