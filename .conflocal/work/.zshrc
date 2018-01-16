bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word

#eval "$(chef shell-init zsh)"
pathmunge /usr/local/opt/*/libexec/gnubin ~/Library/Python/*/bin(N) /usr/local/opt/go/libexec/bin ${GOPATH:-~/go}/bin /usr/local/opt/m4/bin 

for i in /usr/local/opt/*/libexec/gnuman
do
	MANPATH="$i:$MANPATH"
done
export MANPATH

export BYOBU_PREFIX=/usr/local
fpath=(/usr/local/share/zsh-completions $fpath)
