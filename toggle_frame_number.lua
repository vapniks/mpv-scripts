-- toggle_frame_number.lua

local display_enabled = false -- Variable to track whether the display is enabled
local timer = nil -- Timer variable to control periodic updates

-- Function to display the frame number & time
local function display_frame_number()
    if display_enabled then
        local time_pos = mp.get_property_number("time-pos")
        local fps = mp.get_property_number("estimated-vf-fps")
        if time_pos and fps then
            local frame_number = math.floor(time_pos * fps)
            mp.osd_message("Frame: " .. frame_number .. "\nTime: " .. time_pos .. "s")
        end
    end
end

-- Function to toggle the display
local function toggle_display()
    display_enabled = not display_enabled
    if display_enabled then
        -- Start the timer to update the display
        timer = mp.add_periodic_timer(1 / 24, display_frame_number)
    else
        mp.osd_message("Frame number display OFF")    
        -- Stop the timer when display is turned off
        if timer then
            timer:kill()
            timer = nil
        end
    end
end

mp.register_script_message("toggle_frame_display", toggle_display)
