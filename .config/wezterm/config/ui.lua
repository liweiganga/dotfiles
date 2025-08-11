local wezterm = require('wezterm')

return {
    -- tab_bar
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = true,
    -- status update time(ms)
    status_update_interval = 1000,
    -- scrollback
    scrollback_lines = 10000,
    -- close bar
    window_frame = {
        font_size = 13.0,
        active_titlebar_bg = '#1e1e2e',
        inactive_titlebar_bg = '#181825',
    },
}
