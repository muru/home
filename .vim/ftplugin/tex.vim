let g:LatexBox_latexmk_async = 1
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_quickfix = 4
inoremap <buffer> [[ \begin{}<Esc>i
imap ]] <Plug>LatexCloseCurEnv
setlocal colorcolumn=+1
setlocal spell spelllang=en_gb

highlight ColorColumn ctermbg=grey guibg=grey
