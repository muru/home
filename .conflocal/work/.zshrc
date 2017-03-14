bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
pathmunge /usr/local/opt/*/libexec/gnubin ~/Library/Python/*/bin(N) /usr/local/opt/go/libexec/bin ${GOPATH:-~/go}/bin

for i in /usr/local/opt/*/libexec/gnuman
do
	MANPATH="$i:$MANPATH"
done
export MANPATH

export BYOBU_PREFIX=/usr/local
fpath=(/usr/local/share/zsh-completions $fpath)
