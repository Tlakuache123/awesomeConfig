local gears = require("gears")
local wibox = require("wibox")

local brightness_widget = require("..awesome-wm-widgets.brightness-widget.brightness")

local fg_color = "#e0af68"
local bg_color = "#292e42"

local bright_widget = brightness_widget({
	type = "icon_and_text",
  program = "xbacklight",
  font_icon = "Roboto Mono Nerd Complete 12",
})

return {
	{
		{
			bright_widget,
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
