alias pac='pacaur -S'
alias pacs='pacaur -Ss'
alias pacu='pacaur -Syu'
alias pacr='pacaur -Rs'
alias pacl='pacaur -Ql'

[[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]] && 
	source /usr/share/doc/pkgfile/command-not-found.zsh
[[ -n $DISPLAY && -z $SSH_CONNECTION ]] && 
	synclient TapButton1=1 TapButton2=3 TapButton3=2 CircularScrolling=1

alias wg='wget --continue'
