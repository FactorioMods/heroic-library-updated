---@param entity LuaEntity
function is_ghost_entity(entity)
    -- TODO: move to library
    return entity.name == EntityGhost or entity.type == EntityGhost
end
