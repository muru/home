let g:LatexBox_latexmk_async = 1
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_quickfix = 4
inoremap <buffer> [[ \begin{}<Esc>i
imap ]] <Plug>LatexCloseCurEnv
setlocal colorcolumn=+1
setlocal spell spelllang=en_gb

autocmd CursorHold *.tex w

inoreabbrev <buffer> 00 <bar>00\rangle
inoreabbrev <buffer> 10 <bar>10\rangle
inoreabbrev <buffer> 01 <bar>01\rangle
inoreabbrev <buffer> 11 <bar>11\rangle

highlight ColorColumn ctermbg=grey guibg=grey
