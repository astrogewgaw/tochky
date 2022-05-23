vim.cmd([[ let g:coq_settings = { "auto_start": "shut-up" } ]])

local lspinstall = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")
local coq = require("coq")

local servers = {
	"gopls",
	"texlab",
	"bashls",
	"clangd",
	"julials",
	"pyright",
	"sumneko_lua",
	"rust_analyzer",
}

lspinstall.setup({})

for _, name in pairs(servers) do
	local server_is_found, server = lspinstall.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end

	local opts = {
		on_attach = require("neo.plugins.lsp.handles").on_attach,
		capabilities = require("neo.plugins.lsp.handles").capabilities,
	}

	if name == "sumneko_lua" then
		local sumneko_opts = require("neo.plugins.lsp.opts.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	lspconfig[name].setup(coq.lsp_ensure_capabilities(opts))
end
