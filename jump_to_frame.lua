-- jump_to_frame.lua
-- mpv script to jump to a particular frame.
-- This function can be called in the console with an integer argument, e.g: jump_to_frame 50
-- You can bind it to a key by adding a line like the following one (without the initial --) to your input.conf:
-- <KEY> script-message-to console type "script-message jump_to_frame ; keypress ESC" 30
-- where <KEY> should be replaced with the key to bind it to.

function jump_to_frame(frame_number)
    local fps = mp.get_property_number("estimated-vf-fps")
    if fps then
        local timestamp = frame_number / fps
        mp.commandv("seek", timestamp, "absolute")
        mp.osd_message("Jumped to frame: " .. frame_number)
    else
        mp.osd_message("Error: Could not retrieve frame rate.")
    end
end

mp.register_script_message("jump_to_frame", function(frame_number)
    jump_to_frame(tonumber(frame_number))
end)
