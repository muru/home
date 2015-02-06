execute pathogen#infect()
"let g:haddock_browser="/usr/bin/firefox"
let g:syntastic_cpp_compiler_options=' -std=c++11'
let g:localrc_filename=".lvimrc"
let g:SuperTabDefaultCompletionType="context"
set omnifunc=syntaxcomplete#Complete
set foldmethod=syntax
"let g:SuperTabDefaultCompletionType = \"<C-X><C-O>\"

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
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ 12
  endif
endif
let g:syntastic_cpp_compiler_options=' -std=c++11'
autocmd Filetype gitcommit setlocal spell textwidth=72
let g:syntastic_python_python_exec = '/usr/bin/python3'

let g:DiffColors=100
