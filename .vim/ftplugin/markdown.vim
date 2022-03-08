setlocal colorcolumn=+1
setlocal spell spelllang=en_gb

autocmd CursorHold <buffer> if expand("%") | update | fi

highlight ColorColumn ctermbg=grey guibg=grey

inoremap 1-- <!-- section -->
