-- wallpaper.lua
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty") -- Also require naughty here for in-module notifications

local wallpaper_path = "/home/sableoxide/.config/awesome/my_wallpaper.jpg"
naughty.notify({ text = "wallpaper.lua loaded!" }) -- Test if the file itself is loaded

screen.connect_signal("request::wallpaper", function(s)
    -- This notification should appear whenever AwesomeWM requests a wallpaper
    naughty.notify({ text = "request::wallpaper signal fired for screen " .. s.index })

    -- Double check the path before using it
    if not gears.filesystem.file_exists(wallpaper_path) then
        naughty.notify({ text = "Wallpaper file not found: " .. wallpaper_path, timeout = 5 })
        return -- Stop if file doesn't exist
    end

    awful.wallpaper {
        screen = s,
        widget = {
            {
                image = wallpaper_path,
                widget = wibox.widget.imagebox,
            },
            widget = wibox.container.background,
        },
    }
    -- naughty.notify({ text = "Wallpaper set attempt complete for screen " .. s.index })
end)





