local m = {}

local with = vim.lsp.with
local diag = vim.diagnostic
local handles = vim.lsp.handlers
local hover = vim.lsp.handlers.hover
local signature = vim.lsp.handlers.signature_help

m.setup = function()
	local signs = {
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
		{ name = "DiagnosticSignError", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		underline = true,
		virtual_text = false,
		severity_sort = true,
		update_in_insert = true,
		signs = { active = signs },
		float = {
			header = "",
			prefix = "",
			source = "always",
			style = "minimal",
			focusable = false,
			border = "rounded",
		},
	}

	diag.config(config)

	handles["textDocument/hover"] = with(hover, { border = "rounded" })
	handles["textDocument/signatureHelp"] = with(signature, { border = "rounded" })
end

local function lsp_document_highlight(client)
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
                augroup lsp_document_highlight
                    autocmd! * <buffer>
                    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup END
            ]],
			false
		)
	end
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }

	local maps = {
		["K"] = "<cmd>lua vim.lsp.buf.hover()<CR>",
		["gd"] = "<cmd>lua vim.lsp.buf.definition()<CR>",
		["gr"] = "<cmd>lua vim.lsp.buf.references()<CR>",
		["gD"] = "<cmd>lua vim.lsp.buf.declaration()<CR>",
		["gi"] = "<cmd>lua vim.lsp.buf.implementation()<CR>",
		["<C-k>"] = "<cmd>lua vim.lsp.buf.signature_help()<CR>",
		["<leader>q"] = "<cmd>lua vim.diagnostic.setloclist()<CR>",
		["[d"] = '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
		["]d"] = '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
		["gl"] = '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
	}

	for key, cmd in pairs(maps) do
		vim.api.nvim_buf_set_keymap(bufnr, "n", key, cmd, opts)
	end

	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

m.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end
	lsp_keymaps(bufnr)
	lsp_document_highlight(client)
end

local function create_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.preselectSupport = true
	capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
	capabilities.textDocument.completion.completionItem.deprecatedSupport = true
	capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
	capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
	capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = { "documentation", "detail", "additionalTextEdits" },
	}
	capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown" }
	capabilities.textDocument.codeAction = {
		dynamicRegistration = true,
		codeActionLiteralSupport = {
			codeActionKind = {
				valueSet = (function()
					local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
					table.sort(res)
					return res
				end)(),
			},
		},
	}
	return capabilities
end

m.capabilities = create_capabilities()

return m
