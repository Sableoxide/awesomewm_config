local beautiful = require("theme_init")
local awful = require("awful")
local menubar = require("menubar")
local has_fdo, freedesktop = pcall(require, "freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Load Debian menu entries
local debian = require("debian.menu")

local terminal = "kitty"
local editor = os.getenv("EDITOR") or "editor"
local editor_cmd = terminal .. " -e " .. editor

awesome_menu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

local menu_awesome = { "awesome", awesome_menu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }

if has_fdo then
    main_menu = freedesktop.menu.build({
        before = { menu_awesome },
        after =  { menu_terminal }
    })
else
    main_menu = awful.menu({
        items = {
            menu_awesome,
            { "Debian", debian.menu.Debian_menu.Debian },
            menu_terminal,
        }
    })
end

launcher = awful.widget.launcher({ 
    image = beautiful.awesome_icon,
    menu = main_menu 
})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

return {
    main_menu = main_menu,
    launcher = launcher,
    awesome_menu = awesome_menu,
}
