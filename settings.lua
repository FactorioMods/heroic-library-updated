---@type table<LuaSettings>
local heroic_settings = {
    {
        type = "bool-setting",
        name = "heroic-debug",
        setting_type = "startup",
        default_value = true,
    },
}
data:extend(heroic_settings)
