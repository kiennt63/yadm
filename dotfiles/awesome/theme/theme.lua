---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local custom_themes_path = string.format("%s/.config/awesome/theme/", os.getenv("HOME"))

local theme = {}
local pallete = {}

theme.font = "Ligamononoki Nerd Font, Regular 13"

pallete.aurora0 = "#B48EAD"
pallete.aurora1 = "#A3BE8C"
pallete.aurora2 = "#EBCB8B"
pallete.aurora3 = "#D08770"
pallete.aurora4 = "#BF616A"

pallete.frost0 = "#5E81AC"
pallete.frost1 = "#81A1C1"
pallete.frost2 = "#88C0D0"
pallete.frost3 = "#8FBCBB"

-- {{{ Colors
theme.fg_normal  = "#ECEFF4"
theme.fg_focus   = "#88C0D0"
theme.fg_urgent  = "#D08770"
theme.bg_normal  = "#2E3440"
theme.bg_focus   = "#3B4252"
theme.bg_urgent  = "#3B4252"
theme.bg_systray = theme.bg_normal
-- }}}

theme.pallete = pallete

-- {{{ Borders
theme.useless_gap   = dpi(6)
theme.border_width  = dpi(2)
theme.border_normal = "#4c566a"
theme.border_focus  = "#5E81AC"
theme.border_marked = "#D08770"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3B4252"
theme.titlebar_bg_normal = "#2E3440"
-- }}}


-- "#B48EAD"
-- "#A3BE8C"
-- "#EBCB8B"
-- "#D08770"
-- "#BF616A"

-- "#5E81AC"
-- "#81A1C1"
-- "#88C0D0"
-- "#8FBCBB"
-- Taglist colorize
theme.taglist_bg_focus = "#00000000"
theme.taglist_bg_urgent = "#00000000"
theme.taglist_fg_focus = "#81A1C1"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
-- local taglist_square_size = dpi(5)
-- theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
--     taglist_square_size, theme.fg_normal
-- )
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
--     taglist_square_size, theme.fg_normal
-- )
theme.taglist_squares_sel   = custom_themes_path .. "nord/taglist/sel.png"
theme.taglist_squares_unsel = custom_themes_path .. "nord/taglist/unsel.png"

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height       = dpi(15)
theme.menu_width        = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path .. "default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path .. "default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path .. "default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active   = themes_path .. "default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active    = themes_path .. "default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path .. "default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path .. "default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active   = themes_path .. "default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active    = themes_path .. "default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path .. "default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active   = themes_path .. "default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active    = themes_path .. "default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = themes_path .. "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = themes_path .. "default/titlebar/maximized_focus_active.png"

theme.wallpaper = "/home/kiennt54/themes/wallpapers/nord_big.png"

-- -- You can use your own layout icons like this:
-- theme.layout_fairh      = themes_path .. "default/layouts/fairhw.png"
-- theme.layout_fairv      = themes_path .. "default/layouts/fairvw.png"
-- theme.layout_floating   = themes_path .. "default/layouts/floatingw.png"
-- theme.layout_magnifier  = themes_path .. "default/layouts/magnifierw.png"
-- theme.layout_max        = themes_path .. "default/layouts/maxw.png"
-- theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
-- theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
-- theme.layout_tileleft   = themes_path .. "default/layouts/tileleftw.png"
-- theme.layout_tile       = themes_path .. "default/layouts/tilew.png"
-- theme.layout_tiletop    = themes_path .. "default/layouts/tiletopw.png"
-- theme.layout_spiral     = themes_path .. "default/layouts/spiralw.png"
-- theme.layout_dwindle    = themes_path .. "default/layouts/dwindlew.png"
-- theme.layout_cornernw   = themes_path .. "default/layouts/cornernww.png"
-- theme.layout_cornerne   = themes_path .. "default/layouts/cornernew.png"
-- theme.layout_cornersw   = themes_path .. "default/layouts/cornersww.png"
-- theme.layout_cornerse   = themes_path .. "default/layouts/cornersew.png"

-- {{{ Layout
theme.layout_tile       = custom_themes_path .. "nord/layouts/tile_nord_350.png"
theme.layout_tileleft   = custom_themes_path .. "nord/layouts/tileleft.png"
theme.layout_tilebottom = custom_themes_path .. "nord/layouts/tilebottom.png"
theme.layout_tiletop    = custom_themes_path .. "nord/layouts/tiletop.png"
theme.layout_fairv      = custom_themes_path .. "nord/layouts/fairv.png"
theme.layout_fairh      = custom_themes_path .. "nord/layouts/fairh.png"
theme.layout_spiral     = custom_themes_path .. "nord/layouts/spiral.png"
theme.layout_dwindle    = custom_themes_path .. "nord/layouts/dwindle.png"
theme.layout_max        = custom_themes_path .. "nord/layouts/float_nord_350.png"
theme.layout_fullscreen = custom_themes_path .. "nord/layouts/fullscreen.png"
theme.layout_magnifier  = custom_themes_path .. "nord/layouts/magnifier.png"
theme.layout_floating   = custom_themes_path .. "nord/layouts/float.png"
theme.layout_cornernw   = custom_themes_path .. "nord/layouts/cornernw.png"
theme.layout_cornerne   = custom_themes_path .. "nord/layouts/cornerne.png"
theme.layout_cornersw   = custom_themes_path .. "nord/layouts/cornersw.png"
theme.layout_cornerse   = custom_themes_path .. "nord/layouts/cornerse.png"
-- }}}

-- Generate Awesome icon:
-- theme.awesome_icon = theme_assets.awesome_icon(
--     theme.menu_height, theme.bg_focus, theme.fg_focus
-- )

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
-- theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
