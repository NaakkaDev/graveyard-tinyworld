local luax = require("main.libs.luax")

local app = {}
local M = {}

--- Clear the app state or the app value
function M.clear(value)
    if not value then
        app = {}
    else
        app[value] = nil
    end
end

M = setmetatable(M, {
    __newindex = function(self, key, value)
        if type(value) ~= "table" then
            error("You can only add tables. Key: " .. key)
        end

        if app[key] and luax.table.length(app[key]) > 0 then
            error("Trying to override not empty app data. Key: " .. key)
        end

        app[key] = value
    end,

    __index = function(self, key)
        return app[key]
    end
})


return M
