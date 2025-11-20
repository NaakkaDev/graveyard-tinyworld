local app = require("main.system.app")
local utils = require("main.utils.io")


local M = {}


---Get loaded data from main_settings.json db.paths!
---@param data_name string
---@return any
function M.get(data_name)
    assert(data_name, "Provide the data name!")

    local data = app._db[data_name]
    if not data then
        logger:error("The database data does not exist!", data_name)
    end

    return data
end

function M.before_init()
    local settings = app.settings.db
    app._db = {}

    local paths = settings.paths
    for name, path in pairs(paths) do
        local ok, result = pcall(utils.load_json, path)

        if ok then
            app._db[name] = result
        else
            logger:error("Error loading a json file!", { name = name, traceback = result })
            error(result)
        end
    end
end

function M.on_init()
end

return M
