local event    = require("event.event")

local luax     = require("main.libs.luax")

local str_util = require("main.utils.string")
local const    = require("main.core.const")


local M     = {}

-- Save state
local state = {}


--
-- Events
M.SAVE_NOW             = event.create()
M.EVENT_WINDOW_RESIZED = event.create()


-- INTERNAL
-- Default settings, populated by the settings system
M.defaults      = {}

--
-- RENDER
M.window_scale  = 1.0

-- INPUT
M.input_enabled = true


---
---
---

function M.window_listener(self, e, data)
    if (e == window.WINDOW_EVENT_RESIZED) then
        M.window_scale = math.min(
            (data.width / sys.get_config_int("display.width")),
            (data.height / sys.get_config_int("display.height"))
        )

        M.EVENT_WINDOW_RESIZED:trigger(data.width, data.height)
    end
end

---
---
---

function M.init(defaults)
    M.defaults = defaults

    -- Populate the save state with defaults before loading them
    -- in the save system
    state = luax.table.deep_copy(defaults)
end

function M.set_group_volumes()
    -- Set to correct volume to each group.
    for group, value in pairs(M.get(const.AUDIO)) do
        sound.set_group_gain(group, value)
    end
end

---Returns the save state table.
---@return table
function M.get_save_state()
    return state
end

---Get a setting property. The `property` can be "foo" or "foo.bar".
---@param property any
---@return unknown
function M.get(property)
    local property_split = str_util.split(property, ".")
    local prefix = property_split[1]
    local suffix = property_split[2]

    logger:debug("GET -> " .. property)

    if suffix == nil then
        return state[prefix]
    else
        return state[prefix][suffix]
    end
end

---Set a settings property value. The `property` must be "foo.bar".
---@param property string
---@param value any
function M.set(property, value)
    local property_split = str_util.split(property, ".")
    local prefix = property_split[1]
    local suffix = property_split[2]

    if prefix == "audio" and type(value) ~= "number" then
        logger:error("The settings property `audio` value must be a number!")
        return
    end

    state[prefix][suffix] = value

    M.SAVE_NOW:trigger()
end

---Set the default setting values.
---@param prefix string|nil Set default values for one setting group or everything if nill.
function M.set_default(prefix)
    -- Do nothing if the set value is already default
    if luax.table.equals(state[prefix], M.defaults[prefix], false) then
        logger:error("settings already default")
        return
    end

    if prefix == nil then
        -- Reset all settings to defaults
        state = M.defaults
    else
        -- Reset part of the settings to defaults
        state[prefix] = luax.table.deep_copy(M.defaults[prefix])
    end

    M.SAVE_NOW:trigger()
end

return M
