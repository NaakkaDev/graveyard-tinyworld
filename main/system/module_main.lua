-- TODO: editor-script to call python script to automatically generate this file? :D
local module_system = require("main.system.module_system")


-- "No such option, you have to mention every filename in order for Defold to bundle them."
local modules = {
    db = require("main.system.systems.db"),
    settings = require("main.system.systems.settings"),
    save = require("main.system.systems.save")
}

-- @type module
local M = {}

function M.init(settings_path, module_settings, callback)
    for name, module in pairs(modules) do
        M[name] = module
    end

    module_system.init(settings_path, module_settings, modules)

    callback()
end

return M
