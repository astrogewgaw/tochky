require("project_nvim").setup({
	active = true,
	ignore_lsp = {},
	manual_mode = false,
	show_hidden = false,
	silent_chdir = true,
	on_config_done = nil,
	detection_methods = { "pattern" },
	datapath = vim.fn.stdpath("data"),
	patterns = {
		".git",
		"_darcs",
		".hg",
		".bzr",
		".svn",
		"Makefile",
		"package.json",
	},
})

require("telescope").load_extension("projects")
