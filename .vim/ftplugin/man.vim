if exists("b:did_man")
	finish
endif
let b:did_man = 1
setlocal nolist 
setlocal readonly
setlocal buftype=nofile
setlocal bufhidden=hide
setlocal noswapfile
setlocal nomodifiable
setlocal nowrap
setlocal conceallevel=3
setlocal iskeyword+=,_
setlocal concealcursor=nvic

if !exists("*s:MMan")
	function! s:MMan()
		let l:word = substitute(expand('<cword>'), '.\b', '', 'g')
		if winnr('$') == 1 
			vsplit
		endif
		exec 'Man' l:word
	endfunction 

	function s:PrepManPager()
		setlocal modifiable
		if !empty ($MAN_PN)
			"silent %! col -b -x
			%s/.\b//g
			file $MAN_PN
		endif
		setlocal nomodified
		setlocal nomodifiable
	endfunction
endif

"autocmd BufEnter $MAN_PN call PrepManPager()
nnoremap <buffer> q :q!<CR>
nnoremap <buffer> <Space> <PageDown>
nnoremap <buffer> <CR>  :call <SID>MMan()<CR>
nnoremap <buffer> <c-]>  :call <SID>MMan()<CR>
