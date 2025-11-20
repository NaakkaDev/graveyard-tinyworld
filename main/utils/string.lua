local M = {}

-- ---Split a setting property string "foo.bar" into {"foo", "bar"}.
-- ---@param input string
-- ---@return string[]
-- function M.split_string(input)
--     local result = {}
--     for match in string.gmatch(input, "[^%.]+") do
--         table.insert(result, match)
--     end
--     return result
-- end

-------------
-- GENERIC --
-------------

--- Split string and return split items in a table
--- @param input string
--- @param separator string Split separator, for example "." -> "foo.bar" into {"foo", "bar"}.
--- @return table
function M.split(input, separator)
    sep = separator or '%s'
    local t = {}
    for field, s in string.gmatch(input, "[^%" .. sep .. "]+") do
        table.insert(t, field)
        if s == "" then return t end
    end
    return t
end

---Return true if string starts with substring.
---@param str string
---@param start string
---@return boolean
function M.str_starts_with(str, start)
    return str:sub(1, #start) == start
end

---Return true if string ends with substring.
---@param str string
---@param ending string
---@return boolean
function M.str_ends_with(str, ending)
    return ending == "" or str:sub(- #ending) == ending
end

---Transform first character into uppercase and return it.
---@param str string
---@return string
function M.first_to_upper(str)
    return (str:gsub("^%l", string.upper))
end

---Sort a table of string numbers to go from lowest to highest.
---Example: "4, 2, 1, 3" -> "1, 2, 3, 4"
---@param a any
---@param b any
---@return boolean
function M.customSort(a, b)
    -- Extract numeric part from keys
    local numA = tonumber(string.match(a, "%d+$"))
    local numB = tonumber(string.match(b, "%d+$"))

    -- If both keys end with underscore number
    if numA and numB then
        return numA < numB
    elseif numA then
        return true  -- a comes first
    elseif numB then
        return false -- b comes first
    else
        return a < b -- standard lexicographic ordering
    end
end

---Converts a 6 byte hex color to float rgba one. Assumes that the input color contains the # symbol.
---Reason for including the #-symbol is so VSCode displays the colors `Color Highligh` extension.
--- @param color string Example: #ffffff
---@return vector4
function M.hex_to_rgba(color)
    color = string.sub(color, 2, 7)
    local r = tonumber("0x" .. string.sub(color, 1, 2)) / 255
    local g = tonumber("0x" .. string.sub(color, 3, 4)) / 255
    local b = tonumber("0x" .. string.sub(color, 5, 6)) / 255
    return vmath.vector4(r, g, b, 1)
end

----------
-- GAME --
----------

---Item name to an item id.
---Exaple: "Big Fish" -> "big_fish"
---@param name string
---@return string
function M.item_name_to_id(name)
    local id = name:gsub("%s+", "_"):lower()
    return id
end

-------------
--- LISTS ---
-------------

---Sort a string list alphabetically.
---@param a string
---@param b string
---@return boolean
function M.sort_alphabetical(a, b)
    return a["item_id"]:lower() < b["item_id"]:lower()
end

return M
