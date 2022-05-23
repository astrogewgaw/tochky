vim.cmd([[
try
    colorscheme kanagawa
    set background=dark
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
endtry
]])
