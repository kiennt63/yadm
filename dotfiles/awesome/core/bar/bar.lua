local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi



mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    awful.tag({ "  ",
        "﬏  ",
        "  ",
        "  ",
        "  ",
        "  ",
        "  ",
        "  ",
        "  ",
    }, s, awful.layout.layouts[1])

    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

    -- Create a tasklist widget
    -- s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 37 })

    -- Custom widget
    s.volume, s.volume_timer = awful.widget.watch(".config/awesome/core/bar/widgets/volume", 1)
    s.volume:connect_signal("button::press", function(_, _, _, button)
        if button == 1 then
            awful.spawn("pamixer -t", false)
            s.volume_timer:emit_signal("timeout")
        elseif button == 3 then awful.spawn.with_shell("pavucontrol")
        elseif button == 4 then
            awful.spawn("pamixer -i 5 --allow-boost --set-limit 150", false)
            s.volume_timer:emit_signal("timeout")
        elseif button == 5 then
            awful.spawn("pamixer -d 5", false)
            s.volume_timer:emit_signal("timeout")
        end
    end)

    s.battery = awful.widget.watch(".config/awesome/core/bar/widgets/battery", 10)
    s.wifi = awful.widget.watch(".config/awesome/core/bar/widgets/wifi", 10)
    -- s.brightness = awful.widget.watch(".config/awesome/core/bar/widgets/brightness", 1)
    s.layout = awful.widget.watch(".config/awesome/core/bar/widgets/layout", 1)
    -- s.layout:connect_signal("button::press", function()
    --     awful.spawn(".config/awesome/core/bar/widgets/toggle_layout")
    --     s.layout_timer:emit_signal("timeout")
    -- end)

    s.date = awful.widget.watch(".config/awesome/core/bar/widgets/date", 10)
    s.time = awful.widget.watch(".config/awesome/core/bar/widgets/time", 1)

    -- Add widgets to the wibox
    s.mywibox:setup {
        {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                s.mytaglist,
                s.mypromptbox,
            },
            -- s.mytasklist, -- Middle widget
            nil,
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                -- wibox.widget.systray(),
                {
                    s.volume,
                    bg = beautiful.pallete.frost2,
                    fg = beautiful.titlebar_bg_normal,
                    widget = wibox.container.background,
                },
                {
                    s.battery,
                    bg = beautiful.pallete.frost2,
                    fg = beautiful.titlebar_bg_normal,
                    widget = wibox.container.background
                },
                {
                    s.layout,
                    bg = beautiful.pallete.frost3,
                    fg = beautiful.titlebar_bg_normal,
                    widget = wibox.container.background
                },
                {
                    s.wifi,
                    bg = beautiful.pallete.frost3,
                    fg = beautiful.titlebar_bg_normal,
                    widget = wibox.container.background
                },
                -- {
                --     s.date,
                --     bg = beautiful.pallete.frost1,
                --     fg = beautiful.titlebar_bg_normal,
                --     widget = wibox.container.background
                -- },
                -- {
                --     s.time,
                --     bg = beautiful.pallete.frost0,
                --     fg = beautiful.titlebar_bg_normal,
                --     widget = wibox.container.background
                -- },
                {
                    mytextclock,
                    bg = beautiful.pallete.frost1,
                    fg = beautiful.titlebar_bg_normal,
                    widget = wibox.container.background
                },
                {
                    s.mylayoutbox,
                    bg = beautiful.pallete.frost1,
                    fg = beautiful.titlebar_bg_normal,
                    widget = wibox.container.background
                },
            }
        },
        top = dpi(13), -- don't forget to increase wibar height
        left = dpi(13), -- don't forget to increase wibar height
        right = dpi(13), -- don't forget to increase wibar height
        color = "#00000000",
        widget = wibox.container.margin,
    }
end)
