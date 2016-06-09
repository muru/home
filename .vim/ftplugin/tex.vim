inoremap <buffer> [[ \begin{}<Esc>i
setlocal colorcolumn=+1
setlocal spell spelllang=en_gb

autocmd CursorHold <buffer> update

inoremap <buffer> $ $$<left>
inoremap <buffer> gls \gls{}<left>
inoremap <buffer> glr \gls{rsa}
inoremap <buffer> glg \gls{gpg}
inoremap <buffer> glf \gls{fr}

highlight ColorColumn ctermbg=grey guibg=grey

"let g:vimtex_latexmk_options ='-pdflatex="xelatex -shell-escape %O %S " -pdf -dvi- -ps- -synctex=1'
"let g:LatexBox_latexmk_options = ' -xelatex '
"let g:LatexBox_latexmk_async = 1
"let g:LatexBox_latexmk_preview_continuously = 1
"let g:LatexBox_quickfix = 4
let g:vimtex_view_general_viewer = 'qpdfview'
let g:vimtex_view_general_options = '--unique @pdf\#src:@tex:@line:@col'
" In qpdfview, use the following for source editor:
" gvim --remote-tab-silent +%2 %1
let g:vimtex_view_general_options_latexmk = '--unique'
