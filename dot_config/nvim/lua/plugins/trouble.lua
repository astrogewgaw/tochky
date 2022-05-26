require("trouble").setup({
	position = "bottom",
	width = 50,
	height = 10,
	icons = true,
	mode = "workspace_diagnostics",
	fold_open = "",
	fold_closed = "",
	group = true,
	padding = true,
	action_keys = {
		close = "q", -- Close the list.
		cancel = "<esc>", -- Cancel the preview and get back to your last window / buffer / cursor.
		refresh = "r", -- Manually refresh.
		jump = { "<cr>", "<tab>" }, --Jump to the diagnostic or open / close folds.
		open_split = { "<c-x>" }, -- Open buffer in new split.
		open_vsplit = { "<c-v>" }, -- Open buffer in new vsplit.
		open_tab = { "<c-t>" }, -- Open buffer in new tab.
		jump_close = { "o" }, -- Jump to the diagnostic and close the list.
		toggle_mode = "m", -- Toggle between "workspace" and "document" diagnostics mode.
		toggle_preview = "P", -- Toggle auto_preview.
		hover = "K", -- Opens a small popup with the full multiline message.
		preview = "p", -- Preview the diagnostic location.
		close_folds = { "zM", "zm" }, -- Close all folds.
		open_folds = { "zR", "zr" }, -- Open all folds.
		toggle_fold = { "zA", "za" }, -- Toggle fold of current file.
		previous = "k", -- Preview item.
		next = "j", -- Next item.
	},
	indent_lines = true, -- Add an indent guide below the fold icons.
	auto_open = true, -- Automatically open the list when you have diagnostics.
	auto_close = true, -- Automatically close the list when you have no diagnostics.
	auto_preview = true, -- Automatically preview the location of the diagnostic.
	auto_fold = false, -- Automatically fold a file trouble list at creation.
	auto_jump = { "lsp_definitions" }, -- For the given modes, automatically jump if there is only a single result.
	use_diagnostic_signs = true,
})
