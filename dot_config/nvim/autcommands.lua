vim.cmd([[
    augroup set_gen
        autocmd!
        autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
        autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
        autocmd BufWinEnter * :set formatoptions-=cro
        autocmd FileType qf set nobuflisted
    augroup end
    augroup set_git
        autocmd!
        autocmd FileType gitcommit setlocal wrap
        autocmd FileType gitcommit setlocal spell spelllang=en_gb
    augroup end
    augroup set_latex
        autocmd!
        autocmd FileType tex setlocal wrap
        autocmd FileType tex setlocal spell spelllang=en_gb
    augroup end
    augroup set_markdown
        autocmd!
        autocmd FileType markdown setlocal wrap
        autocmd FileType markdown setlocal spell spelllang=en_gb
    augroup end
    augroup set_auto_resize
        autocmd!
        autocmd VimResized * tabdo wincmd = 
    augroup end
    augroup set_alpha
        autocmd!
        autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
    augroup end
]])
