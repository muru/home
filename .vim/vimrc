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
set grepprg=grep\ -nH\ $*

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

let g:tex_flavor = "latex"

noremap ; :
noremap , ;
noremap < :tabp<CR>
noremap > :tabn<CR>
noremap <leader>, :bp<CR>
noremap <leader>. :bn<CR>
command! C let @/=""
cmap w!! w !sudo tee >/dev/null %
noremap cy "*y
noremap cp "*p
noremap <leader>p "+p
noremap <leader>y "+y
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
nnoremap <Down> gj
nnoremap <Up> gk

execute pathogen#infect()
autocmd Bufenter,BufNew *.pro set syntax=prolog
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Bufenter *.hs compiler ghc

colorscheme molokai

" From http://vi.stackexchange.com/questions/258/
autocmd BufWritePre *.sh if !filereadable(expand('%')) | let b:is_new = 1 | endif
autocmd BufWritePost *.sh if get(b:, 'is_new', 0) | silent execute '!chmod +x %' | endif

let g:SuperTabDefaultCompletionType = "context"
set omnifunc=syntaxcomplete#Complete
set foldmethod=syntax
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:airline#extensions#tabline#enabled = 1
let g:LatexBox_latexmk_options = ' -xelatex '
let g:LatexBox_latexmk_async = 1
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_quickfix = 4
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
"  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

" From http://vi.stackexchange.com/questions/239/
if @% == "" && getcwd() == "/tmp"
	:silent edit test.sh
endif

let g:DiffColors = 100

" function LookupFiles ()
" 	python <<EOF
" from os.path import *
" from vim import *
" current_file = eval ('expand("%")')
" current_index = str (current.buffer.number)
" PATHS = ['~', '~/.vim', '/etc']
"
" if current_file != '' and  not isfile (current_file):
" 	for p in map (expanduser, PATHS):
" 		f = join (p, current_file)
" 		if isfile (f):
" 			command ('bad ' + f)
" 			command ('bd ' + current_index)
" 			command ('bl')
" 			# command ('silent keepalt file ' + f)
" 			break
" EOF
" endfunction
"
" autocmd BufWinEnter * nested call LookupFiles()

" From http://vi.stackexchange.com/questions/2009/
function! FindInPath(name)
    let path=&path
    " Add any extra directories to the normal search path
    set path+=~,~/.vim,/etc
    " If :find finds a file, then wipeout the buffer that was created for the "new" file
    setlocal bufhidden=wipe
    exe 'silent! keepalt find '. fnameescape(a:name)
    " Restore 'path' and 'bufhidden' to their normal values
    let &path=path
    set bufhidden<
endfunction
autocmd BufNewFile * nested call FindInPath(expand('<afile>'))

"au VimEnter * tab all | tabfirst

" From http://vi.stackexchange.com/questions/2358/
autocmd FileType * exec("setlocal dictionary+=".$HOME."/.vim/dictionary/".expand('<amatch>'))
set completeopt+=menuone,longest,preview
set complete+=k

if !empty($CONFLOCAL)
	source $HOME/.vim/local/$CONFLOCAL.vim
endif
let g:airline#extensions#tabline#enabled= 0
