alias pac='yay -S'
alias pacs='yay -Ss'
alias pacu='yay -Syu'
alias pacr='yay -Rs'
alias pacl='yay -Ql'

[[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]] &&
	source /usr/share/doc/pkgfile/command-not-found.zsh

if [[ ! $DISPLAY && $XDG_VTNR -eq 2 ]]; then
	sleep 10
	exec startx
fi
