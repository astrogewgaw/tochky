vim.cmd([[
    augroup fmt
        autocmd!
        autocmd BufWritePre * undojoin | Neoformat
    augroup end
]])
vim.g.neoformat_enabled_lua = { "stylua" }
vim.g.neoformat_enabled_python = { "black" }
