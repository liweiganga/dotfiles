local M = {}

function M.option(opt)
    for prefix, tbl in pairs(opt) do
        for key, value in pairs(tbl) do
            vim[prefix][key] = value
        end
    end
end

return M
