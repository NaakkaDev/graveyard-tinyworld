local saver = require("saver.saver")

local settings = require("main.settings.settings")


local M = {}

local function save_on_demand()
    saver.save_game_state()

    logger:debug("Saved on demand.")
end

function M.init()
    saver.init()

    -- Unsubscribe probably not needed since this happens
    -- only once and when the game closes it goes poof
    settings.SAVE_NOW:subscribe(save_on_demand, M)

    saver.bind_save_state("settings", settings.get_save_state())
end

return M
