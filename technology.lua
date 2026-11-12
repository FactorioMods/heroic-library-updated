---@param researchPrerequisites table<TechnologyID>
---@param default table<data.IngredientPrototype>
---@return table<data.IngredientPrototype>
function combined_prerequisites(researchPrerequisites, default)
    ---@type table<data.IngredientPrototype>
    local ingredients = {}

    for i, key in ipairs(researchPrerequisites) do
        if type(key) ~= "string" then
            key = key.name
        end
        table.extend(ingredients, data.raw["technology"][key].unit.ingredients)
    end

    if next(ingredients) == nil then
        return default
    end

    return table.unique_kv(ingredients)
end

---@param force LuaForce
---@param name string
---@param level number
function get_tech_level(force, name, level)
    local suffix = utils.get_level_suffix(level)
    local tech_name = name .. suffix
    if force.technologies[tech_name].researched then
        return level
    end
    return 0
end

---@param tech LuaTechnology
function recursive_unresearch_technology(tech)
    for _, i in pairs(tech.successors) do
        recursive_unresearch_technology(i)
    end
    tech.researched = false
end