local app = require("main.system.app")
local utils = require("main.utils.io")


local M = {}

local function load_modules(modules)
    M.modules = modules

    M.modules_callbacks = {
        before_init = {},
        on_init = {},
        after_init = {},
        verify = {},
    }

    for name, module in pairs(modules) do
        local settings = app.settings[name]

        if not settings or settings and not settings.is_disabled then
            for func_name, callbacks in pairs(M.modules_callbacks) do
                if module[func_name] then
                    table.insert(callbacks, module[func_name])
                end
            end
        end
    end
end

local function apply_module_settings(module_settings)
    if not module_settings then
        logger:debug("No custom module settings")
        return
    end

    -- if M.modules.db and module_settings.db_settings then
    --     M.modules.db.set_settings(module_settings.db_settings)
    -- end
end

local function call_each_module(func_name, ...)
    for i = 1, #M.modules_callbacks[func_name] do
        M.modules_callbacks[func_name][i](...)
    end
end


local function load_settings(settings_path)
    local settings = utils.load_json(settings_path)
    assert(settings, "No settings found on path: " .. (settings_path or ""))

    app.settings = settings
end


function M.init(settings_path, module_settings, modules)
    app.clear()

    load_settings(settings_path)
    load_modules(modules)
    apply_module_settings(module_settings)

    call_each_module("before_init")
    call_each_module("on_init")
    call_each_module("after_init")
    call_each_module("verify")
end

return M
