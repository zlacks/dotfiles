
local gears     = require("gears")
local lain      = require("lain")
local awful     = require("awful")
local wibox     = require("wibox")
local dpi       = require("beautiful.xresources").apply_dpi
local collision = require("collision")

local os       = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local theme    = {}

-------------------------------------------------------------------------------
-- QUICK THEME 
-------------------------------------------------------------------------------

theme.font                     = "Iosevka 10"
theme.bg_normal                = "#3A2A4D"  -- Backgrounds and outer border
theme.menu_border_color        = "#f8f8f2"  -- Inner border
theme.bg_focus                 = "#5F4A8B"  -- Highlighting (tag, tasklist, popup menu)
theme.fg_focus                 = "#C5A3FF"  -- Client window focus border and infobox highlighting
theme.fg_normal                = "#f8f8f2"  -- Text
theme.border_width             = 6          -- Outer border width
theme.menu_border_width        = 2          -- Inner border width
theme.menu_width               = 130        -- Right-click pop-up menu width
theme.notification_icon_size   = 50
theme.notification_max_width   = 800
theme.useless_gap              = 6          -- Default space between windows
theme.systray_icon_spacing     = 3
theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon    = false

-------------------------------------------------------------------------------
-- WALLPAPER AND ICONS
-------------------------------------------------------------------------------
-- NOTE: Notification icons are retrieved from /usr/share/pixmap/

theme.confdir  = os.getenv("HOME") .. "/.config/awesome"
--theme.wallpaper              = theme.confdir .. "/wall.png"
theme.menu_submenu_icon     = theme.confdir .. "/icons-colour/submenu.png"
theme.widget_temp           = theme.confdir .. "/icons-colour/temp.png"
theme.widget_uptime         = theme.confdir .. "/icons-colour/ac.png"
theme.widget_cpu            = theme.confdir .. "/icons-colour/cpu.png"
theme.widget_weather        = theme.confdir .. "/icons-colour/dish.png"
theme.widget_fs             = theme.confdir .. "/icons-colour/fs.png"
theme.widget_mem            = theme.confdir .. "/icons-colour/mem.png"
theme.widget_note           = theme.confdir .. "/icons-colour/note.png"
theme.widget_note_on        = theme.confdir .. "/icons-colour/note_on.png"
theme.widget_netdown        = theme.confdir .. "/icons-colour/net_down.png"
theme.widget_netup          = theme.confdir .. "/icons-colour/net_up.png"
theme.widget_mail           = theme.confdir .. "/icons-colour/mail.png"
theme.widget_batt           = theme.confdir .. "/icons-colour/bat.png"
theme.widget_clock          = theme.confdir .. "/icons-colour/clock.png"
theme.widget_vol            = theme.confdir .. "/icons-colour/spkr.png"
theme.taglist_squares_sel   = theme.confdir .. "/icons-bw/square_sel.png"
theme.taglist_squares_unsel = theme.confdir .. "/icons-bw/square_unsel.png"
theme.layout_tile           = theme.confdir .. "/icons-bw/tile.png"
theme.layout_tilegaps       = theme.confdir .. "/icons-bw/tilegaps.png"
theme.layout_tileleft       = theme.confdir .. "/icons-bw/tileleft.png"
theme.layout_tilebottom     = theme.confdir .. "/icons-bw/tilebottom.png"
theme.layout_tiletop        = theme.confdir .. "/icons-bw/tiletop.png"
theme.layout_fairv          = theme.confdir .. "/icons-bw/fairv.png"
theme.layout_fairh          = theme.confdir .. "/icons-bw/fairh.png"
theme.layout_spiral         = theme.confdir .. "/icons-bw/spiral.png"
theme.layout_dwindle        = theme.confdir .. "/icons-bw/dwindle.png"
theme.layout_max            = theme.confdir .. "/icons-bw/max.png"
theme.layout_fullscreen     = theme.confdir .. "/icons-bw/fullscreen.png"
theme.layout_magnifier      = theme.confdir .. "/icons-bw/magnifier.png"
theme.layout_floating       = theme.confdir .. "/icons-bw/floating.png"
theme.layout_termfair       = theme.confdir .. "/lain/icons/layout/zenburn/termfair.png"
theme.layout_centerfair     = theme.confdir .. "/lain/icons/layout/zenburn/centerfair.png"
theme.layout_cascade        = theme.confdir .. "/lain/icons/layout/zenburn/cascade.png"
theme.layout_cascadetile    = theme.confdir .. "/lain/icons/layout/zenburn/cascadetile.png"
theme.layout_centerwork     = theme.confdir .. "/lain/icons/layout/zenburn/centerwork.png"
theme.layout_centerworkh    = theme.confdir .. "/lain/icons/layout/zenburn/centerworkh.png"

-------------------------------------------------------------------------------
-- EXTENDED THEME 
-------------------------------------------------------------------------------

theme.bg_alternate                 = theme.bg_focus
theme.bg_urgent                    = theme.fg_focus
theme.fg_urgent                    = theme.fg_normal
theme.fg_minimize                  = theme.fg_normal
theme.border_normal                = theme.bg_normal
theme.border_focus                 = theme.bg_normal
theme.border_marked                = theme.bg_focus
theme.menu_fg_normal               = theme.fg_normal
theme.menu_fg_focus                = theme.fg_normal
theme.menu_bg_normal               = theme.bg_normal
theme.menu_bg_focus                = theme.bg_focus
theme.taglist_fg_focus             = theme.fg_normal
theme.taglist_bg_focus             = theme.bg_focus
theme.tasklist_fg_focus            = theme.fg_normal
theme.tasklist_bg_focus            = theme.bg_focus
theme.hotkeys_border_width         = theme.menu_border_width
theme.hotkeys_modifiers_fg         = theme.fg_focus
theme.notification_border_color    = theme.menu_border_color
theme.collision_focus_border_width = 0
theme.collision_focus_fg           = theme.fg_normal    -- Window switch arrow
theme.collision_focus_bg           = theme.bg_focus     -- Arrow background
theme.collision_focus_bg_center    = theme.fg_focus     -- Circle background
theme.collision_max_fg             = theme.fg_normal    -- Tag switch not-selected
theme.collision_max_bg             = theme.bg_normal    -- Tag switch background
theme.collision_resize_bg          = theme.bg_focus     -- Resize arrow background
theme.collision_shape_width        = 60
theme.collision_shape_height       = 60

-------------------------------------------------------------------------------
-- WIBAR WIDGETS
-------------------------------------------------------------------------------

local markup = lain.util.markup

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local mytextclock = wibox.widget.textclock(markup("#7788af", "%A %d %B ") .. markup("#ab7367", ">") .. markup("#de5e1e", " %H:%M "))
mytextclock.font = theme.font

-- Calendar
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
theme.cal = calendar_widget({
    theme                 = 'dark',
    placement             = 'top_right',
    start_sunday          = true,
    previous_month_button = 4, -- Scroll up
    next_month_button     = 5, -- Scroll down
})
mytextclock:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then theme.cal.toggle() end
    end)

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e33a6e", cpu_now.usage .. "% "))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#f1af5f", coretemp_now .. "°C "))
    end
})

-- Battery
--local baticon = wibox.widget.imagebox(theme.widget_batt)
--local bat = lain.widget.bat({
--    settings = function()
--        local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "%" or bat_now.perc
--
--        if bat_now.ac_status == 1 then
--            perc = perc .. " plug"
--        end
--
--        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, perc .. " "))
--    end
--})

-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volume_now.level = volume_now.level .. "M"
        end

        widget:set_markup(markup.fontfg(theme.font, "#7493d2", volume_now.level .. "% "))
    end
})

-- Net
local netdownicon = wibox.widget.imagebox(theme.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(theme.widget_netup)
local netupinfo = lain.widget.net({
    settings = function()
        --[[ uncomment if using the weather widget
        if iface ~= "network off" and
           string.match(theme.weather.widget.text, "N/A")
        then
            theme.weather.update()
        end
        --]]

        widget:set_markup(markup.fontfg(theme.font, "#e54c62", net_now.sent .. " "))
        netdowninfo:set_markup(markup.fontfg(theme.font, "#87af5f", net_now.received .. " "))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e0da37", mem_now.used .. "M "))
    end
})

-- Logout widget
local logout_menu_widget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")

-------------------------------------------------------------------------------
-- BUILD WIBARS AND TITLEBARS
-------------------------------------------------------------------------------

function theme.at_screen_connect(s)

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- different tag tables for each screen
    if s.index==1 then
    -- create tags for screen 1
    awful.tag({ "1", "2", "3", "4" }, screen[1], awful.layout.layouts[1])
    elseif s.index==2 then
    -- create tags for screen 2
    awful.tag( {"1", "2" }, screen[2], awful.layout.layouts[1])
    elseif s.index==3 then
    -- create tags for screen 3
    awful.tag( {" "}, screen[3], awful.layout.layouts[3])
    end

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Set tasklist items to set width of 300
    local common = require("awful.widget.common")
    local function list_update(w, buttons, label, data, objects)
        common.list_update(w, buttons, label, data, objects)
        w:set_max_widget_size(300)
        w:set_min_widget_size(300)
    end

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = awful.util.tasklist_buttons,
        style   = {
            shape_border_width = 2,
            shape_border_color = theme.bg_normal,
        },
        layout  = {
            spacing_widget = {
                {
                    forced_width = 0,
                    widget       = wibox.widget.separator
                },
                valign = 'center',
                halign = 'center',
                widget = wibox.container.place,
            },
            layout = wibox.layout.flex.horizontal
        },
        widget_template = {
            {
                {
                    {
                        {
                            id     = 'icon_role',
                            widget = wibox.widget.imagebox,
                        },
                        margins = 2,
                        widget  = wibox.container.margin,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left   = 10,
                right  = 10,
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background,
        },
        update_function = list_update,
    }

    -- Create a box behind the top wibox for a second border
    s.behindwibox = awful.wibar({
        screen = s,
        stretch = true,
        height = 36,
        margins = {top = 10, left = 12, right = 12},
        bg = theme.bg_normal
    })

    -- Create the wibox
    s.mywibox = awful.wibar({
        screen = s,
        stretch = true,
        height = 20,
        border_width = theme.menu_border_width,
        border_color = theme.menu_border_color,
        margins = {top = 16, left = 18, right = 18},
        bg = theme.bg_normal,
        fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = 20,
            s.mytaglist,
            s.mypromptbox
        },
        nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --mailicon,
            --theme.mail.widget,
            netdownicon,
            netdowninfo,
            netupicon,
            netupinfo.widget,
            volicon,
            theme.volume.widget,
            memicon,
            memory.widget,
            cpuicon,
            cpu.widget,
            --fsicon,
            --theme.fs.widget,
            --weathericon,
            --theme.weather.widget,
            tempicon,
            temp.widget,
            --baticon,
            --bat.widget,
            clockicon,
            mytextclock,
            logout_menu_widget{
                font = theme.font,
                onlock = function() awful.spawn.with_shell('i3lock-preset.sh') end
            },
        },
    }

    -- Create a box behind the bottom wibox for a second border
    s.behindbottomwibox = awful.wibar({
        screen = s,
        position = "bottom",
        stretch = true,
        height = 36,
        margins = {bottom = 10, left = 12, right = 12},
        bg = theme.bg_normal
    })

    -- Create the bottom wibox
    s.mybottomwibox = awful.wibar({
        screen = s,
        position = "bottom",
        stretch = true,
        height = 20,
        border_width = theme.menu_border_width,
        border_color = theme.menu_border_color,
        margins = {bottom = -20, left = 18, right = 18},
        bg = theme.bg_normal,
        fg = theme.fg_normal})

    -- Add widgets to the bottom wibox
    s.mybottomwibox.widget = {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytasklist,
        },
        nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = 3,
            wibox.widget.systray(),
            s.mylayoutbox,
        },
    }
end

-- Use titlebars to create second border on client windows
function theme.titlebar_fun(c)
    local titlebar_width = theme.menu_border_width
    awful.titlebar(c, {
        size = titlebar_width,
        position = "top",
        bg_normal = theme.menu_border_color,
        bg_focus = theme.fg_focus,
    })
    awful.titlebar(c, {
        size = titlebar_width,
        position = "left",
        bg_normal = theme.menu_border_color,
        bg_focus = theme.fg_focus,
    })
    awful.titlebar(c, {
        size = titlebar_width,
        position = "right",
        bg_normal = theme.menu_border_color,
        bg_focus = theme.fg_focus,
    })
    awful.titlebar(c, {
        size = titlebar_width,
        position = "bottom",
        bg_normal = theme.menu_border_color,
        bg_focus = theme.fg_focus,
    })
end

-- activate Collsion w/ theme
collision()

return theme
