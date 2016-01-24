 if has("gui_running")
   if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 13
	set guioptions-=r
   endif
 endif
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
