-- jump_to_frame.lua

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
