-- Theme handling library
local beautiful = require("beautiful")
local naughty = require("naughty")

-- Themes define colours, icons, font and wallpaper.
local user = require("usr_config")
local ok, err = pcall(require, "usr_config")
if ok then
    naughty.notify({ title = "usr_config success", text = "loaded" })
elseif err then
    naughty.notify({ preset = naughty.config.presets.critical, title = "usr_config error", text = err })
end

local theme_path = "/home/" .. user.username .. "/.config/awesome/themes/default/theme.lua"
beautiful.init(theme_path)

return beautiful