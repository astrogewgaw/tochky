local options = {
	wrap = true, -- Wrap lines.
	mouse = "a", -- Use the mouse in Neovim.
	tabstop = 4, -- Expand a tab to 4 spaces.
	number = true, -- Show line numbers.
	hidden = true, --
	scrolloff = 8, --
	cmdheight = 2, -- Height of the Neovim command line,
	textwidth = 80, -- Wrap lines at this width.
	pumheight = 10, -- Height of the pop-up menus in Neovim.
	shiftwidth = 4, -- Number of spaces to use for each indentation level.
	backup = false, --
	hlsearch = true, --
	linebreak = true, --
	expandtab = true, -- Expand a tab to spaces.
	swapfile = false, --
	smartcase = true, -- If there are upper case letters in a search pattern
	timeoutlen = 100,
	ignorecase = true,
	splitbelow = true,
	splitright = true,
	cursorline = true,
	sidescrolloff = 8, --
	signcolumn = "yes", -- Always show the sign column.
	termguicolors = true, -- Use GUI colors in the terminal.
	fileencoding = "utf-8", -- Unicode encoding for all files.
	clipboard = "unnamedplus", -- Allow Neovim to use system clipboard.
}

local globals = {
	python2_host_prog = 0,
	python3_host_prog = "/home/neo/conda/bin/python",
}

for key, value in pairs(options) do
	vim.o[key] = value
end

for key, value in pairs(globals) do
	vim.g[key] = value
end
