local app      = require("main.system.app")

local settings = require("main.settings.settings")


local M = {}


function M.default_settings()
    return M.defaults
end

function M.before_init()
    -- Load default settings
    M.defaults = app.settings.settings
end

function M.on_init()
    -- Auto init settings using the systems.
    settings.init(M.defaults)
end

return M
