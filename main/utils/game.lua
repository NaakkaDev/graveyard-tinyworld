local rendy = require "rendy.rendy"
local M = {}

--- Returns the center world position of a tile.
---@param x integer Cell x coordinate.
---@param y integer Cell y coordinate.
---@param tile_w integer Tile width.
---@param tile_h integer Tile height.
---@return vector3
function M.tile_world_position(x, y, tile_w, tile_h)
    local pos_x = (x * tile_w) - tile_w / 2
    local pos_y = (y * tile_h) - tile_h / 2
    return vmath.vector3(pos_x, pos_y, 0)
end

--- Checks if the supplied x and y coords intersect with given sprite (go)
---@param sprite_url string|url
---@param x integer screen_x (window space)
---@param y integer screen_y (window space)
---@param camera_id hash
---@param game_scale number
---@param dead_space vector3
---@param safearea number
---@return boolean
function M.touch_sprite(sprite_url, x, y, camera_id, game_scale, dead_space, safearea)
    local pos = go.get_world_position(sprite_url)
    local size = go.get(sprite_url, hash("size"))
    local scale = go.get(sprite_url, hash("scale"))

    size.x = (size.x * game_scale) * scale.x
    size.y = (size.y * game_scale) * scale.y

    pos = rendy.world_to_screen(camera_id, pos)

    pos.x = (pos.x + (dead_space.x * 0.5))
    -- pos.y = (pos.y + (config.dead_space.y * 0.5))

    pos.y = pos.y - (safearea / game_scale)

    y = y - (safearea / game_scale)

    local half_height = (size.y * 0.5)
    local top = pos.y + half_height
    local bottom = pos.y - half_height

    local half_width = (size.x * 0.5)
    local left = pos.x - half_width
    local right = pos.x + half_width

    if x < left or x > right then
        return false
    end

    if y < bottom or y > top then
        return false
    end

    return true
end

return M
