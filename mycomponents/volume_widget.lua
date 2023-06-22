local gears = require("gears")
local wibox = require("wibox")

local volume_widget = require("..awesome-wm-widgets.volume-widget.volume")


local fg_color = "#7aa2f7"
local bg_color = "#292e42"

local vol_widget = volume_widget({
	widget_type = "icon_and_text",
  text_icon_font = "Roboto Mono Nerd Complete 12"
})

return {
	{
		{
			vol_widget,
			layout = wibox.layout.fixed.horizontal,
		},
		widget = wibox.container.margin,
		left = 10,
		right = 10,
	},
  fg = fg_color,
	bg = bg_color,
	widget = wibox.container.background,
	shape = gears.shape.rounded_rect,
}
