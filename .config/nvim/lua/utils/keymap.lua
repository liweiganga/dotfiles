local G = {}

function G.register(map)
    map.options.desc = map.description

    if type(map.rhs) == "function" or map.options.buffer then
        vim.keymap.set(
            map.mode,
            map.lhs,
            map.rhs,
            map.options
        )
        return
    end

    for _, mode in ipairs(map.mode) do
        vim.api.nvim_set_keymap(
            mode,
            map.lhs,
            map.rhs,
            map.options
        )
    end
end

function G.unregister(mode, lhs, opts)
    vim.keymap.del(mode, lhs, opts)
end

function G.bulk_register(maps)
    for _, map in pairs(maps) do
        G.register(map)
    end
end

return G
