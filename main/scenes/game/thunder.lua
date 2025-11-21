---@class thunder
---@field index integer Current thunder index.
---@field thunder_map table<integer,integer>
---@field private _thunder_type integer
---@field private _delay number
---@field private _ambient vector4
---@field private _easing vector
---@field private _sfx string
local M                  = {}

local INSTANCE_METATABLE = { __index = M }


local AMBIENT_DISTANT = vmath.vector4(0.4, 0.4, 0.6, 1.1)
local AMBIENT_STRONG  = vmath.vector4(0.6, 0.6, 0.8, 1.3)

local EASING_DISTANT  = vmath.vector({ 0.0, 0.5, 0.2, 0.35, 0.1, 0.2, 0.0 })
local EASING_STRONG   = vmath.vector({ 0.0, 1.0, 0.3, 0.95, 0.2, 0.7, 0.1, 0.5, 0.0 })

local SFX_DISTANT     = "main:/audio#thunder_distant"
local SFX_STRONG      = "main:/audio#thunder_big"

local THUNDER_TYPE    = {
    DISTANT = 1,
    STRONG  = 2
}


---New thunder instance.
---@param thunder_map table<integer>
---@return thunder self
function M.new(thunder_map)
    ---@type thunder
    local self = setmetatable({}, INSTANCE_METATABLE)

    self.index = 0
    self.thunder_map = thunder_map

    return self
end


---Next thunder type and relevant params.
---@param delay number|nil If the delay is not set then a random value is used.
---@return thunder self
function M:next(delay)
    self.index = self.index + 1
    -- Start from the beginning if reached the end.
    if self.index > #self.thunder_map then
        self.index = 1
    end

    self._thunder_type = self.thunder_map[self.index]
    self._delay        = delay or self:_get_delay()
    self._ambient      = self:_get_ambient()
    self._easing       = self:_get_easing()
    self._sfx          = self:_get_sfx()

    logger:debug("[THUNDER] next", {
        delay = self._delay,
        ambient = self._ambient,
        easing = self._easing,
        sfx = self._sfx
    })

    return self
end


---Animate the thunder ambient color.
---@param callback function|nil Optional callback to call when animation has finished.
function M:strike(callback)
    callback = callback or function() end

    go.animate("#", "ambient", go.PLAYBACK_ONCE_FORWARD, self._ambient, self._easing, 0.9, self._delay, function()
        sound.play(self._sfx, { delay = 1 })
        callback()
    end)
end


---Keeps the thunder looping.
function M:storm()
    self:next()
    self:strike(function()
        self:storm()
    end)
end


---Get the delay for the next thunder.
---@private
---@return number
function M:_get_delay()
    return math.random(8, 20)
end


---Get the correct ambient vector based on the current thunder type.
---@private
---@return vector4
function M:_get_ambient()
    if self._thunder_type == THUNDER_TYPE.DISTANT then
        return AMBIENT_DISTANT
    elseif self._thunder_type == THUNDER_TYPE.STRONG then
        return AMBIENT_STRONG
    end

    return vmath.vector4(0)
end


---Get the correct easing.
---@private
---@return vector
function M:_get_easing()
    if self._thunder_type == THUNDER_TYPE.DISTANT then
        return EASING_DISTANT
    elseif self._thunder_type == THUNDER_TYPE.STRONG then
        return EASING_STRONG
    end

    return vmath.vector({ 0, 0.5, 1, 0.5, 0 })
end


---Get the correct sfx.
---@private
---@return string
function M:_get_sfx()
    if self._thunder_type == THUNDER_TYPE.DISTANT then
        return SFX_DISTANT
    elseif self._thunder_type == THUNDER_TYPE.STRONG then
        return SFX_STRONG
    end

    return ""
end


return M
