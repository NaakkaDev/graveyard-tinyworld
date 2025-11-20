local wrap = require("wrap.wrap")

local M = {}

---Check if the given coordinates intersect with the given node.
---@param node string|node
---@param x number
---@param y number
---@return boolean
function M.touch_gui(node, x, y)
    local slider = wrap.node(node)
    local screen_pos = slider:get_screen_position()
    local size = slider:get_size()

    local half_height = (size.y * 0.5)
    local top = screen_pos.y + half_height
    local bottom = screen_pos.y - half_height

    local half_width = (size.x * 0.5)
    local left = screen_pos.x - half_width
    local right = screen_pos.x + half_width

    if x < left or x > right then
        return false
    end

    if y < bottom or y > top then
        return false
    end

    return true
end

--- Center gui node horizontally (left <- node -> right)
--- Assumes that all the related node pivots are bottom left (South West)
--- @param node node|string
function M.center_node(node, width, y_pos, y_scale)
    if type(node) == "string" then
        node = gui.get_node(node)
    end

    local pivot = gui.get_pivot(node)
    local pos = gui.get_position(node)
    local size = gui.get_size(node)
    local scale = gui.get_scale(node)
    local node_half_width = (size.x * scale.x) * 0.5

    if width ~= nil then
        node_half_width = (width * scale.x) * 0.5
    end

    -- By default the parent of this node is the window width
    -- just in case there is no parent node for the `node`.
    local w, h = window.get_size()
    local parent_size = vmath.vector3(w, h, 0)

    -- Get the parent node
    local parent_node = gui.get_parent(node)
    if parent_node ~= nil then
        parent_size = gui.get_size(parent_node)
    end

    local parent_half_point = parent_size.x * 0.5
    local new_x_pos = parent_half_point - node_half_width
    if pivot == gui.PIVOT_SW then
    end

    pos.x = new_x_pos
    pos.y = y_pos * y_scale
    gui.set_position(node, pos)
end

return M
