local bindings = mp.get_property_native("input-bindings")

for _, binding in ipairs(bindings) do
    print(string.format("Key: %s | Command: %s", binding.key, binding.cmd))
end

mp.osd_message("Keybindings printed to terminal.")
