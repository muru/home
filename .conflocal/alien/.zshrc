alias pac='yay -S'
alias pacs='yay -Ss'
alias pacu='yay -Syu'
alias pacr='yay -Rs'
alias pacl='yay -Ql'

[[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]] && 
	source /usr/share/doc/pkgfile/command-not-found.zsh

ind () {
	gsettings set org.gnome.system.proxy mode manual
	ssh ind
	gsettings set org.gnome.system.proxy mode none
}
