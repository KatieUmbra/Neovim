--[[
-- Citing here again for good measure
-- https://fredrikaverpil.github.io/blog/2026/04/15/from-lazy.nvim-to-vim.pack/#passing-opts-from-one-plugin-to-another
-- To be totally honest, I'm not even sure if I'm gonna use this, but its here
-- update: Used it a whole fucking lot LMFAO
--]]--
local function merge(base, override)
    for k, v in pairs(override) do
        if v == vim.NIL then
            base[k] = nil
        elseif type(v) == "table" then
            local base_value = base[k]
            if type(base_value) ~= "table" then
                base[k] = v
            elseif vim.islist(v) then
                for _, item in ipairs(v) do
                    if type(item) == "table" or not vim.list_contains(base_value, item) then
                        table.insert(base_value, item)
                    end
                end
            else
                merge(base_value, v)
            end
        else
            base[k] = v
        end
    end
    return base
end

return merge
