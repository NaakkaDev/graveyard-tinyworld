local M = {}

---COROUTINE ANIMATION
----Example:
---utils.sequencer(
---  utils.co_flipbook(sprite_url, hashed.laser_eye_open),
---  utils.co_flipbook(sprite_url, hashed.laser_eye_close)
---)()

--- resumes after duration
function M.co_timer(duration)
    return function()
        local co = coroutine.running()
        assert(co, "You must call this function from within a coroutine")

        timer.delay(duration, false, function()
            coroutine.resume(co)
        end)

        coroutine.yield()
    end
end

--- sprite.play_flibook
function M.co_flipbook(url, animation, properties)
    local args = { properties }

    return function()
        local co = coroutine.running()
        assert(co, "You must call this function from within a coroutine")

        local function resume()
            coroutine.resume(co)
        end

        sprite.play_flipbook(url, animation, resume, unpack(args))

        coroutine.yield()
    end
end

function M.sequencer(...)
    local args = { ... }

    local sequence = coroutine.wrap(function()
        for i = 1, #args do
            local fn = args[i]
            fn()
        end
    end)

    return sequence
end

return M
