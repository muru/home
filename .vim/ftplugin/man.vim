setlocal nolist 
setlocal readonly
setlocal buftype=nofile
setlocal bufhidden=hide
setlocal noswapfile
setlocal nomodifiable

function! PrepManPager()
	setlocal modifiable
	if !empty ($MAN_PN)
		silent %! col -b
		file $MAN_PN
	endif
	setlocal nomodified
	setlocal nomodifiable
endfunction

autocmd BufEnter $MAN_PN call PrepManPager()
nnoremap q :q!<CR>
