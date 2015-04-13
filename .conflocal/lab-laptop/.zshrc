alias pac='pacaur -S'
alias pacs='pacaur -Ss'
alias pacu='pacaur -Syu'
alias pacr='pacaur -Rs'
alias pacl='pacaur -Ql'

[[ -f ~/devel/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/devel/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh
[[ -f /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
[[ -n $DISPLAY ]] && synclient TapButton1=1 TapButton2=3 TapButton3=2 CircularScrolling=1
