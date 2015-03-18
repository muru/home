inoremap <buffer> [[ \begin{}<Esc>i
imap ]] <Plug>LatexCloseCurEnv
setlocal colorcolumn=+1
setlocal spell spelllang=en_gb

autocmd CursorHold *.tex w

inoreabbrev <buffer> /. <bar>\rangle<esc>bba

highlight ColorColumn ctermbg=grey guibg=grey
