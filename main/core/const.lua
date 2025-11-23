local event = require("event.event")
local str_utils = require("main.utils.string")


---@class main_const
local M = {}


---
--- EVENTS
---
M.EVENT = {}


---
---
---
M.AUDIO = "audio"


---
--- INPUTS
---
M.INPUT                  = {}
M.INPUT.KEY_1            = hash("key_1")
M.INPUT.KEY_2            = hash("key_2")
M.INPUT.KEY_3            = hash("key_3")
M.INPUT.KEY_4            = hash("key_4")
M.INPUT.KEY_5            = hash("key_5")
M.INPUT.KEY_6            = hash("key_6")
M.INPUT.KEY_NP_1         = hash("key_np_1")
M.INPUT.KEY_NP_2         = hash("key_np_2")
M.INPUT.KEY_NP_3         = hash("key_np_3")
M.INPUT.KEY_NP_4         = hash("key_np_4")
M.INPUT.KEY_NP_5         = hash("key_np_5")
M.INPUT.KEY_NP_6         = hash("key_np_6")
M.INPUT.MOUSE_WHEEL_UP   = hash("mouse_wheel_up")
M.INPUT.MOUSE_WHEEL_DOWN = hash("mouse_wheel_down")
M.INPUT.M                = hash("key_m")


---
--- SETTINGS
---
M.SETTINGS               = {}
M.SETTINGS.VOLUME_GROUPS = { "master", "music", "sfx", "gui" }


---
--- MESSAGE HASHES
---
M.HASH                 = {}
M.HASH.SOUND_DONE      = hash("sound_done")
M.HASH.GAME_OVER       = hash("game_over")
M.HASH.TOGGLE_CONTROLS = hash("toggle_controls")

M.HASH.SET_PARENT      = hash("setparent") -- `set_parent` is reserved by the engine.i


---
--- ANIMATION TIMES
---
M.ANIM = {}


---
--- TIMER TIMES
---
M.TIMER = {}



return M
