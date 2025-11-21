local current_music_track = nil

local M = {}

function M.play_music(track)
    -- Automatically stop any previous music track if its different
    if current_music_track ~= nil and current_music_track ~= track then
        M.stop_music(current_music_track)
    end

    -- Url for the current music
    local music_url = msg.url(nil, "music", track)
    -- Get the volume target
    -- local target_volume = go.get(music_url, "gain") -- TODO: persisted setting
    local target_volume = 0.5
    local volume = 0.0

    -- Set the volume gain to 0.0 so it can be increased
    go.set(music_url, "gain", volume)
    -- Play the music track
    sound.play(music_url)
    -- Save the track for later use
    current_music_track = track

    -- Gradually increase the volume gain
    timer.delay(0.2, true, function(self, handle, time_elapsed)
        volume = volume + 0.05
        go.set(music_url, "gain", volume)
        -- Kill this timer when the target has been reached
        if volume >= target_volume then
            timer.cancel(handle)
        end
    end)
end


---Stop music by gently fading it out
---@param track string
function M.stop_music(track)
    -- Url for the current music
    local music_url = msg.url(nil, "music", track)
    -- Get the current volume
    local volume = go.get(music_url, "gain")
    -- Lower the volume gain by 0.05 every 0.2 second till its zero
    timer.delay(0.2, true, function(self, handle, time_elapsed)
        volume = volume - 0.05
        go.set(music_url, "gain", volume)
        if volume <= 0.0 then
            sound.stop(music_url)
            timer.cancel(handle)
        end
    end)
end


function M.set_volume_gain(new_gain)
    -- Url for the current music
    local music_url = msg.url(nil, "music", new_gain)

    go.set(music_url, "gain", new_gain)
end


return M
