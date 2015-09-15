case $(systemd-detect-virt) in
	none)
		;;
	*)
		precmd () {print -Pn "\e]0;%m: %2~\a"}
		export TERM=xterm-256color
		;;
esac

HISTFILE=$HOME/.debian_history
