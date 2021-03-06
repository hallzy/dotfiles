-- Create a timer that will trigger every 6 seconds.
timer = mp.add_periodic_timer(6, function()
    -- The timer will end looping for this file and then stop and reset itself
    mp.set_property("loop-file", "no");
    timer:kill();
end);

-- Start with the timer stopped and reset
timer:kill();

-- When a file is loaded turn looping back on and resume the timer
mp.register_event("file-loaded", function()
    mp.set_property("loop-file", "yes");
    timer:resume();
end);

-- When a file is ended kill the timer so that it resets
mp.register_event("end-file", function()
    timer:kill();
end);

-- Watch for a pause
mp.observe_property("pause", "bool", function(name, value)
    -- If playback is paused, then pause the timer
    if value == true then
        timer:stop();
    -- If now we are unpaused, then unpause the timer
    else
        timer:resume();
    end
end);

-- Ctrl+x will open the current file in sxiv
mp.add_key_binding("ctrl+x", function()
    -- Get the path to the file
    filePath = mp.get_property("path");

    mp.set_property("pause", "yes");

    -- Open in SXIV
    mp.commandv("run", "/bin/sh", "-c", "/usr/local/bin/sxiv '" .. filePath .. "'");
end);
