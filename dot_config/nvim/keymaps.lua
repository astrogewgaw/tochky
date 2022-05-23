local g = vim.g
local kmap = vim.api.nvim_set_keymap
local defs = { noremap = true, silent = true }

-- Set up <SPC> as the leader key.
g.mapleader = " "
g.maplocalleader = " "
kmap("", "<Space>", "<Nop>", defs)

-- All the Neovim modes.
local modes = {
	normal = "n",
	insert = "i",
	visual = "v",
	command = "c",
	terminal = "t",
	visual_block = "x",
}

-- All the keybindings.
local binds = {
	-- Normal mode.
	normal = {
		-- Common operations.
		["<C-s>"] = ":w<CR>",
		["<C-x>"] = ":q!<CR>",
		["<C-a>"] = "ggVG<CR>",

		-- Buffer navigation.
		-- Move to previous/next buffer:
		["<A-,>"] = ":BufferPrevious<CR>",
		["<A-.>"] = ":BufferNext<CR>",
		-- Re-order to previous/next
		["<A-<>"] = ":BufferMovePrevious<CR>",
		["<A->>"] = " :BufferMoveNext<CR>",
		-- Goto buffer in position...:
		["<A-1>"] = ":BufferGoto 1<CR>",
		["<A-2>"] = ":BufferGoto 2<CR>",
		["<A-3>"] = ":BufferGoto 3<CR>",
		["<A-4>"] = ":BufferGoto 4<CR>",
		["<A-5>"] = ":BufferGoto 5<CR>",
		["<A-6>"] = ":BufferGoto 6<CR>",
		["<A-7>"] = ":BufferGoto 7<CR>",
		["<A-8>"] = ":BufferGoto 8<CR>",
		["<A-9>"] = ":BufferGoto 9<CR>",
		["<A-0>"] = ":BufferLast<CR>",
		-- Close buffer:
		["<A-c>"] = ":BufferClose<CR>",
		-- Magic buffer-picking mode:
		["<C-p>"] = ":BufferPick<CR>",

		-- Move text up and down.
		["<A-Up>"] = "<Esc>:m .-2<CR>==gi",
		["<A-Down>"] = "<Esc>:m .+1<CR>==gi",
	},

	-- Insert mode.
	insert = {
		-- Move text up and down.
		["<A-Up>"] = "<Esc>:m .-2<CR>==gi",
		["<A-Down>"] = "<Esc>:m .+1<CR>==gi",
	},

	-- Visual mode.
	visual = {
		["<"] = "<gv",
		[">"] = ">gv",
		["<A-Up>"] = ":m .-2<CR>==",
		["ga"] = "<Plug>(EasyAlign)",
		["<A-Down>"] = ":m .+1<CR>==",
	},
}

for mode, maps in pairs(binds) do
	local sym = modes[mode]
	for key, cmd in pairs(maps) do
		kmap(sym, key, cmd, defs)
	end
end
