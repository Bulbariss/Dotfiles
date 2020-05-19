function move_window(direction)
    return function()
        local win      = hs.window.focusedWindow()
        local app      = win:application()
        local app_name = app:name()
        local f        = win:frame()
        local screen   = win:screen()
        local max      = screen:frame()
        if direction == "left" then
            f.x = max.x 
            f.w = (max.w / 2)
        elseif direction == "right" then
            f.x = (max.x + (max.w / 2)) 
            f.w = (max.w / 2)
        elseif direction == "up" then
            f.x = max.x 
            f.w = max.w 
        elseif direction == "down" then
            f.x = (max.x + (max.w / 8)) 
            f.w = (max.w * 3 / 4) 
        elseif direction == "left-min" then
            f.x = max.x 
            f.w = (max.w / 3)
        elseif direction == "right-min" then
            f.x = (max.x + (max.w / 3 * 2)) 
            f.w = (max.w / 3)
        elseif direction == "left-max" then
            f.x = max.x 
            f.w = (max.w / 3 * 2)
        elseif direction == "right-max" then
            f.x = (max.x + (max.w / 3)) 
            f.w = (max.w / 3 * 2)
        end
        f.y = max.y 
        f.h = max.h 
        win:setFrame(f, 0.0)
    end
end
hs.hotkey.bind({"shift", "alt", "cmd"}, "Left", move_window("left-min"))
hs.hotkey.bind({"shift", "alt", "cmd"}, "Right", move_window("right-min"))
hs.hotkey.bind({"shift", "alt", "cmd"}, "Up", move_window("left-max"))
hs.hotkey.bind({"shift", "alt", "cmd"}, "Down", move_window("right-max"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", move_window("left"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", move_window("right"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", move_window("up"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", move_window("down"))

local obj = hs.loadSpoon("HoldToQuit")
obj:init()
obj:start()