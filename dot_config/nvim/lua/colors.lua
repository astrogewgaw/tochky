vim.cmd([[
try
    colorscheme gruvbox-material
    set background=dark
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
endtry
]])
