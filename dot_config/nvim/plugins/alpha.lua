local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Header.
dashboard.section.header.val = {
	[[]],
	[[ ███████╗ ██╗  ██████╗  ███╗   ██╗ ]],
	[[ ╚══███╔╝ ██║ ██╔═══██╗ ████╗  ██║ ]],
	[[   ███╔╝  ██║ ██║   ██║ ██╔██╗ ██║ ]],
	[[  ███╔╝   ██║ ██║   ██║ ██║╚██╗██║ ]],
	[[ ███████╗ ██║ ╚██████╔╝ ██║ ╚████║ ]],
	[[ ╚══════╝ ╚═╝  ╚═════╝  ╚═╝  ╚═══╝ ]],
	[[]],
}

-- Menu.
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Plugins", ":e ~/.config/nvim/lua/neo/plugins/core.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

-- Footer.
dashboard.section.footer.val = {
	[[]],
	[[ Welcome to Zion, Neo. ]],
	[[]],
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
