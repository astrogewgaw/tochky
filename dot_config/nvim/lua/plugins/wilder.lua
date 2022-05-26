local wilder = require("wilder")
wilder.setup({ modes = { ":", "/", "?" } })

wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
		reverse = 0,
		border = "rounded",
		min_height = "75%",
		max_height = "75%",
		prompt_position = "top",
		highlighter = wilder.basic_highlighter(),
	}))
)
