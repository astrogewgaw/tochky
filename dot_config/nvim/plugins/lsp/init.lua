require("lspconfig")
require("neo.plugins.lsp.install")
require("neo.plugins.lsp.format")
require("neo.plugins.lsp.handles").setup()

-- HACK: Enable the Julia Language Server.
-- Somehow this is not working directly via
-- Neovim and its LSP.

vim.cmd([[
" Julia Default Version.
let g:default_julia_version = '1.7'

" Julia Language Server.
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
\   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
\       using LanguageServer;
\       using Pkg;
\       import StaticLint;
\       import SymbolServer;
\       env_path = dirname(Pkg.Types.Context().env.project_file);
\       
\       server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path, "");
\       server.runlinter = true;
\       run(server);
\   ']
\ }
]])
