[[ -f ~/devel/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/devel/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -f /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
case $(systemd-detect-virt) in
	none)
		;;
	*)
		precmd () {print -Pn "\e]0;%m: %2~\a"}
		export TERM=xterm-256color
		;;
esac

HISTFILE=$HOME/.debian_history
