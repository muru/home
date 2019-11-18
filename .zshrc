[[ -f ~/.zshrc.grml ]] &&
	. ~/.zshrc.grml
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit -i
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

# Stuff from Arch Wiki

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
	function zle-line-init () {
		printf '%s' "${terminfo[smkx]}"
	}
	function zle-line-finish () {
		printf '%s' "${terminfo[rmkx]}"
	}
	zle -N zle-line-init
	zle -N zle-line-finish
fi

autoload -U promptinit
promptinit

# [[ -d $HOME/.cache/zsh ]] || mkdir -p "$HOME/.cache/zsh"
# DIRSTACKFILE="$HOME/.cache/zsh/dirs"
#
# if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
# 	dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
# 	[[ -z $ITERM_PROFILE ]] && [[ -d $dirstack[1] ]] && cd $dirstack[1]
# fi
# chpwd() {
# 	print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
# }

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias l='ls --color=auto'
alias ll='ls --color=auto -Ahl'
alias g='grep --color=auto'
alias h='history | grep'

alias sz='sudo -i zsh -l'
alias wg='wget --continue'

autoload -U colors && colors
if [[ -n $SSH_TTY ]]
then
	PROMPT="%{$fg[green]%}%B%n%{$reset_color%}@%{$fg_bold[blue]%}%m%{$fg[white]%}|%{$fg_bold[yellow]%}[%?] %{$fg_bold[cyan]%}%1~%b%{$reset_color%}%\$ %{$fg_bold[yellow]%}"
else
	PROMPT="%{$fg[green]%}%B%n%{$reset_color%}%{$fg[white]%}|%{$fg_bold[yellow]%}[%?] %{$fg_bold[cyan]%}%1~%b%{$reset_color%}%\$ %{$fg_bold[yellow]%}"
fi
RPROMPT="%{$reset_color%}"

case $TERM in
	xterm*|screen*)
		if [[ -n $SSH_TTY ]]
		then
			precmd () {print -Pn "\e]0;%m: %2~\a"}
		else
			precmd () {print -Pn "\e]0;%2~\a"}
		fi
		;;
esac

setopt appendhistory histignorespace histignorealldups histnostore histreduceblanks histsavenodups
autoload is-at-least
if is-at-least 5.3.0 $ZSH_VERSION
then
	setopt incappendhistorytime
else
	setopt incappendhistory
fi

# Search backwards and forwards with a pattern
bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M vicmd '?' history-incremental-pattern-search-forward

# set up for insert mode too
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M viins '^F' history-incremental-search-forward

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Help from Arch

autoload -U run-help
autoload run-help-git
alias help=run-help

ssht () {
	ssh -Xt "$@" '$SHELL -lic byobu'
}
compdef _ssh_hosts ssht

bh () {
	bash -c 'for i; do help $i | less -X; done' bash_help "$@"
}

dux () {
	sudo du -hx --max-depth 1 "$@" | sort -h
}

# pip zsh completion start
function _pip_completion {
	local words cword
	read -Ac words
	read -cn cword
	reply=( $( COMP_WORDS="$words[*]" \
				COMP_CWORD=$(( cword-1 )) \
				PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end

if [[ -n $COLORTERM ]]
then
	case $TERM in
		xterm*)
			TERM=xterm-256color
			;;
		screen*)
			TERM=screen-256color
			;;
	esac
fi
export TERM
export CDPATH="$CDPATH:$HOME"
export MANPAGER='vim --not-a-term -'
export MANWIDTH=80

setopt BRACE_CCL

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

if [[ $TERM = screen* ]]
then
	# If running in screen, set the window title to the command about to be executed
	preexec() {
		[ -n "$WINDOW" ] && print -Pn "\ek$2\e\\"
	}

	# If in screen, blank the window title when displaying the prompt
	precmd() {
		[ -n "$WINDOW" ] && print -Pn "\ek-\e\\"
	}
fi

vup () (
	cd
	vim -c PlugUpgrade -c PlugUpdate -c qa
	git submodule update --remote
)

if command -v apt-get && command -v apt
then
	alias up='sudo apt update; sudo apt full-upgrade --autoremove --purge -y'
elif command -v apt-get
then
	alias up='sudo apt-get update; sudo apt-get dist-upgrade --autoremove --purge -y'
elif command -v brew
then
	alias up='brew upgrade; brew cleanup'
fi &> /dev/null

[[ -f ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]] &&
	. ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
[[ -f ~/.conflocal/$CONFLOCAL/.zshrc ]] &&
	. ~/.conflocal/$CONFLOCAL/.zshrc
fpath=(~/.zsh/completion $fpath)
compinit
