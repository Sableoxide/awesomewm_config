-- what is the purppse of this file? slowly moving elements from rc.lua to here,  rc.lua will only have imports in the future
-- SYS LIBRARIES
-- Standard awesome library
-- local gears = require("gears")
-- local awful = require("awful")
local naughty = require("naughty")

-- USER/CUSTOM LIBRARIES
-- local user = require("usr_config")
local set_wallpaper = require("wallpaper")

-- set wallpaper
screen.connect_signal("request:wallpaper", set_wallpaper)

-- notification testing
naughty.notify({
    title = "Greeting",
    text = " border normal:" .. beautiful.border_normal .. "\nfocus: ".. beautiful.border_normal,
    timeout = 5
})
