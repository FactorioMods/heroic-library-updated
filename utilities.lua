utilities = {}


function utilities.debug(message)
  log(message)
  if settings.global["__heroic_library__.heroic-debug"].value then
    game.print(message)
  end
end

---@param sprite_path data.FileName
---@param icon data.FileName
---@return data.IconData
function utilities.sprite_add_icon(sprite_path, icon)
  local icons =
  {
    {
      icon = sprite_path,
      icon_size = 256, icon_mipmaps = 4
    },
    {
      icon = icon,
      icon_size = 64,
      icon_mipmaps = 3,
      shift = {80, 100},
      scale = 1.5
    }
  }
  return icons
end


---@param to_check string
---@param target string
---@return boolean
function utilities.string_starts_with(to_check, target)
  return string.sub(to_check, 1, string.len(target)) == target
end


---@param position data.MapPosition
---@param bounding_box BoundingBox
---@return boolean
function utilities.inside_bounding_box(position, bounding_box)
    return (
      position.x >= bounding_box.left_top.x
      and position.y >= bounding_box.left_top.y
      and position.x <= bounding_box.right_bottom.x
      and position.y <= bounding_box.right_bottom.y
    )
end


-- Needs testing
---@param bounding_box_1 BoundingBox
---@param bounding_box_2 BoundingBox
---@return boolean
function utilities.inside_bounding_boxes(bounding_box_1, bounding_box_2)
  return (
    bounding_box_1.left_top.x < bounding_box_2.right_bottom.x
    and bounding_box_1.left_top.y < bounding_box_2.right_bottom.y
    and bounding_box_1.right_bottom.x > bounding_box_2.left_top.x
    and bounding_box_1.right_bottom.y > bounding_box_2.left_top.y
  )
end

---@param num number
---@param decimals number | nil
---@return number
function utilities.round(num, decimals)
  decimals = math.pow(10, decimals or 0)
  num = num * decimals
  if num >= 0 then
    num = math.floor(num + 0.5) else num = math.ceil(num - 0.5)
  end
  return num / decimals
end

function utilities.initialize_storage_var(var_name, default_value)
  if storage[var_name] == nil then
      storage[var_name] = default_value
  end
end
