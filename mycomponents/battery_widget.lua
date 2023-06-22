local gears = require("gears")
local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")

local fg_color = "#9ece6a"
local bg_color = "#292e42"

-- battery infos from freedesktop upower
local mybattery = awful.widget.watch(
	{
		awful.util.shell,
		"-c",
		"upower -i /org/freedesktop/UPower/devices/battery_BAT1 | sed -n '/present/,/icon-name/p'",
	},
	30,
	function(widget, stdout)
		local bat_now = {
			present = "N/A",
			state = "N/A",
			warninglevel = "N/A",
			energy = "N/A",
			energyfull = "N/A",
			energyrate = "N/A",
			voltage = "N/A",
			percentage = "N/A",
			capacity = "N/A",
			icon = "N/A",
		}

		for k, v in string.gmatch(stdout, "([%a]+[%a|-]+):%s*([%a|%d]+[,|%a|%d]-)") do
			if k == "present" then
				bat_now.present = v
			elseif k == "state" then
				bat_now.state = v
			elseif k == "warning-level" then
				bat_now.warninglevel = v
			elseif k == "energy" then
				bat_now.energy = string.gsub(v, ",", ".") -- Wh
			elseif k == "energy-full" then
				bat_now.energyfull = string.gsub(v, ",", ".") -- Wh
			elseif k == "energy-rate" then
				bat_now.energyrate = string.gsub(v, ",", ".") -- W
			elseif k == "voltage" then
				bat_now.voltage = string.gsub(v, ",", ".") -- V
			elseif k == "percentage" then
				bat_now.percentage = tonumber(v) -- %
			elseif k == "capacity" then
				bat_now.capacity = string.gsub(v, ",", ".") -- %
			elseif k == "icon-name" then
				bat_now.icon = v
			end
		end

		-- customize here
		widget:set_text(bat_now.percentage --[[.. " " .. bat_now.state--]])
	end
)



return {
	{
		{
      {
        font = "Roboto Mono Nerd Complete 12",
        text = "󰁹",
        widget = wibox.widget.textbox
      },
			mybattery,
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
