---Used to combine strings within '.. "-" ..' to avoid typos
---@param names string[]
---@return string
function combine(names)
    local new = ""
    for i, name in pairs(names) do
        if i == 1 then
            new = name
        else
            new = new .. "-" .. name
        end
    end
    return new
end
