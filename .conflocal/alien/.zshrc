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


# From /etc/profile.d/vte.sh
# Enclose the primary prompt between
# ← OSC 133;D;retval ST (report exit status of previous command)
# ← OSC 133;A ST (mark beginning of prompt)
# → OSC 133;B ST (mark end of prompt, beginning of command line)
zstyle ':prompt:grml:*:items:user' pre $'%{\e]133;D;%?\e\\\e]133;A\e\\%}%F{45}'
zstyle ':prompt:grml:*:items:sad-smiley' post $'%{\e]133;B\e\\%}%f'
