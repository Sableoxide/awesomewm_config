local awful = require("awful")
local gears = require("gears")
local app_launcher = require("app_launcher")

root.buttons(gears.table.join(
    awful.button({ }, 3, function () app_launcher.main_menu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
