set nocompatible
set ruler
set number
set bg=dark

set incsearch
" This shows what you are typing as a command.  I love this!
set showcmd
"
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
set title

nore ; :
nore , ;
map < :tabp<CR>
map > :tabn<CR>
command! C let @/=""
command! Make make!
cmap w!! w !sudo tee >/dev/null %
colorscheme elflord

execute pathogen#infect()
au Bufenter *.hs compiler ghc
let g:SuperTabDefaultCompletionType="context"
set omnifunc=syntaxcomplete#Complete
set foldmethod=syntax
"let g:SuperTabDefaultCompletionType = \"<C-X><C-O>\"
set laststatus=2
set pastetoggle=<F10>
let g:syntastic_cpp_compiler_options=' -std=c++11'
autocmd Filetype gitcommit setlocal spell textwidth=72
let g:syntastic_python_python_exec = '/usr/bin/python3'

vnoremap cy "*y
vnoremap cp "*p
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

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

set laststatus=2

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ 12
  endif
endif

let g:DiffColors=100
