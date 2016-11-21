bindkey '^[[1;C' backward-word
bindkey '^[[1;D' forward-word
for f in /usr/local/Cellar/*/*/libexec/gnubin
do
	PATH=$f:$PATH
	MANPATH=${f%/libexec/gnubin}/share/man:$MANPATH
done
