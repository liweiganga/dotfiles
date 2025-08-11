local wezterm = require('wezterm')
local act = wezterm.action

return {
    leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1500 },
    keys = {
        -- tab
        { key = 'c', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },
        { key = '&', mods = 'LEADER|SHIFT', action = act.CloseCurrentTab { confirm = true } },
        { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
        { key = 'Tab', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
        { key = 'f', mods = 'LEADER', action = act.ToggleFullScreen },
        { key = '1', mods = 'LEADER', action = act.ActivateTab(0) },
        { key = '2', mods = 'LEADER', action = act.ActivateTab(1) },
        { key = '3', mods = 'LEADER', action = act.ActivateTab(2) },
        { key = '4', mods = 'LEADER', action = act.ActivateTab(3) },
        { key = '5', mods = 'LEADER', action = act.ActivateTab(4) },
        { key = '6', mods = 'LEADER', action = act.ActivateTab(5) },
        { key = '7', mods = 'LEADER', action = act.ActivateTab(6) },

        -- pane
        { key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
        { key = '|', mods = 'LEADER|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },
        { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },
        { key = 'o', mods = 'LEADER', action = act.PaneSelect { mode = 'Activate' }, },
        { key = 'b', mods = 'LEADER', action = act.PaneSelect },
    },
    mouse_bindings = {
        {
            event = { Down = { streak = 1, button = 'Right' } },
            action = act.PasteFrom 'Clipboard',
        },
    },
}
