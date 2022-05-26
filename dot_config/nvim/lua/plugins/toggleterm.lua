require("toggleterm").setup({
	size = 20,
	shading_factor = 2,
	direction = "float",
	hide_numbers = true,
	persist_size = true,
	shell = vim.o.shell,
	shade_filetypes = {},
	close_on_exit = true,
	shade_terminals = true,
	start_in_insert = true,
	insert_mappings = true,
	open_mapping = [[<c-\>]],
	float_opts = {
		winblend = 0,
		border = "curved",
		highlights = { border = "Normal", background = "Normal" },
	},
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-Left>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-Down>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-Up>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-Right>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

-- Custom terminals.
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local btm = Terminal:new({ cmd = "btm", hidden = true })
function _BTM_TOGGLE()
	btm:toggle()
end

local ipython = Terminal:new({ cmd = "ipython", hidden = true })
function _IPYTHON_TOGGLE()
	ipython:toggle()
end
