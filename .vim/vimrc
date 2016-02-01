set nocompatible
set ruler
set number
"set bg=dark

set incsearch
" This shows what you are typing as a command.  I love this!
set showcmd
" Who doesn't like autoindent?
set autoindent

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
filetype plugin indent on
syntax enable
set grepprg=grep\ -nH

" Spaces are better than a tab character
" set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch

set tags=tags;/
set wrap
set formatoptions=tcrql
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set history=200
set backspace=indent,eol,start
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
set pastetoggle=<F10>
set title
set titlelen=20
set laststatus=2
set wildignore+=*.aux,*.toc,*.pdf
set isfname-==
set display+=lastline
set undofile
set undodir=$HOME/.vim/undo

let g:tex_flavor = "latex"

function! s:Help2Url (...)
	if winheight('%') < winwidth('%')
		exec 'silent! vert bo help ' . ( a:0 ? a:1 : '' )
	else
		exec 'silent! help ' . ( a:0 ? a:1 : '' )
	endif
	if ! a:0
		exec "normal \<c-T>"
	endif
	let l:tagfile = expand ('%:t')
	let @+ = expand ('<cword>')
	python import urllib
	let @+ = pyeval ('urllib.quote_plus ("' . @+ . '")')
	let @+ = printf ('http://vimhelp.appspot.com/%s.html#%s', l:tagfile, @+)
endfunction

command! -nargs=? -complete=help H call s:Help2Url (<f-args>)

noremap ; :
noremap , ;
nnoremap < :tabp<CR>
nnoremap > :tabn<CR>
noremap <leader>, :bp<CR>
noremap <leader>. :bn<CR>
command! C let @/=""
cnoremap w!! w !sudo tee >/dev/null %
noremap <leader>P "*p
noremap <leader>p "+p
noremap <leader>Y "*y
noremap <leader>y "+y
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
nnoremap <Down> gj
nnoremap <Up> gk

execute pathogen#infect()

colorscheme molokai
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Visual ctermbg=DarkGrey

" From http://vi.stackexchange.com/questions/258/
autocmd BufWritePre *.sh if !filereadable(expand('%')) | let b:is_new = 1 | endif
autocmd BufWritePost *.sh if get(b:, 'is_new', 0) | silent execute '!chmod +x %' | endif

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1
set omnifunc=syntaxcomplete#Complete
set foldmethod=syntax
"set foldlevelstart=1
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:airline#extensions#tabline#enabled = 1
"let g:LatexBox_latexmk_options = ' -xelatex '
"let g:LatexBox_latexmk_async = 1
"let g:LatexBox_latexmk_preview_continuously = 1
"let g:LatexBox_quickfix = 4
let g:vimtex_view_general_viewer = 'qpdfview'
let g:vimtex_view_general_options = '--unique @pdf\#src:@tex:@line:@col'
" In qpdfview, use the following for source editor:
" gvim --remote-tab-silent +%2 %1
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_latexmk_options ='-xelatex -synctex=1'
let g:airline#extensions#tabline#enabled = 0
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 10000
let g:DiffColors = 100
let g:DiffUnit = "Word3"
let g:DiffUpdate = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1

if !empty($MAN_PN)
	autocmd StdinReadPost * set ft=man | file $MAN_PN
elseif @% == "" && getcwd() == "/tmp"
" From http://vi.stackexchange.com/questions/239/
" with exception for reading manpages
	try 
		silent find test.*
	catch /^Vim\%((\a\+)\)\=:E345/
		silent edit test.sh
	endtry
endif

" From http://vi.stackexchange.com/questions/2009/
function! FindInPath(name)
	" Force creation of new file for paths beginning with ./
	if expand('%') !~ '^[.~]\?/'
		try 
			let path=&path
			" Add any extra directories to the normal search path
			set path+=~,~/.vim,/etc
			" If :find finds a file, then wipeout the buffer that was created for the "new" file
			setlocal bufhidden=wipe
			exe 'silent keepalt find! '. fnameescape(expand('<afile>'))
			" Restore 'path' and 'bufhidden' to their normal values
			let &path=path
			set bufhidden<
		catch /^Vim\%((\a\+)\)\=:E345/
			return 0
		endtry
	endif
endfunction
autocmd BufNewFile * nested call FindInPath(expand('<afile>'))

"au VimEnter * tab all | tabfirst

" From http://vi.stackexchange.com/questions/2358/
autocmd FileType * exec("setlocal dictionary+=".$HOME."/.vim/dictionary/".expand('<amatch>'))
set completeopt+=menuone,longest,preview
set complete+=k

runtime local/$CONFLOCAL.vim
