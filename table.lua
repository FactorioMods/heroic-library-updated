
---@generic T
---@param t1 T
---@param t2 T
---@return T
table.extend = function (t1, t2)
    for _, v in ipairs(t2) do
        table.insert(t1, v)
    end
    return t1
end


---@generic T
---@param t T
---@return T
table.unique = function (t)
    local seen = {}
    local res = {}
    for _, v in ipairs(t) do
        if not seen[v] then
            seen[v] = true
            table.insert(res, v)
        end
    end
    return res
end


---@generic T: table<any, any>
---@param t T
---@return T
table.unique_kv = function (t)
    local seen = {}
    local res = {}
    for _, entry in ipairs(t) do
        local key = entry[1]
        local value = entry[2]
        if not seen[key] then
            seen[key] = true
            table.insert(res, {key, value})
        end
    end
    return res
end