if has("gui_running")
  if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ 13
  endif
endif

set path+=~/devel/elearning_academy/**
set wildignore+=/home/bro3886/devel/elearning_academy/elearning_academy/**
set textwidth=85

autocmd BufWritePost ~/devel/elearning_academy/* call system("collect.sh")

autocmd BufEnter ~/devel/elearning_academy/* let g:syntastic_python_python_exec = '/usr/bin/python2'
