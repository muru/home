# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/bro3886/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
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

DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus

export DEBEMAIL="murukesh@cse.iitb.ac.in"
export DEBFULLNAME="Murukesh Mohanan"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias l='ls --color=auto'
alias ll='ls --color=auto -Al'
alias g='grep --color=auto'
alias h='history | grep'

alias pac='pacaur -S'
alias pacs='pacaur -Ss'
alias pacu='pacaur -Syu'
alias pacr='pacaur -Rs'

autoload -U colors && colors
if [[ -n $SSH_TTY ]]
then
	PROMPT="%{$fg[green]%}%B%n%{$reset_color%}@%{$fg_bold[blue]%}%m%{$fg[white]%}|%{$fg_bold[yellow]%}[%?] %{$fg_bold[cyan]%}%1~%b%{$reset_color%}%\$ %{$fg_bold[yellow]%}"
else
	PROMPT="%{$fg[green]%}%B%n%{$reset_color%}%{$fg[white]%}|%{$fg_bold[yellow]%}[%?] %{$fg_bold[cyan]%}%1~%b%{$reset_color%}%\$ %{$fg_bold[yellow]%}"
fi
RPROMPT="%{$reset_color%}"

case $TERM in
	xterm*)
		if [[ -n $SSH_TTY ]]
		then
			precmd () {print -Pn "\e]0;%m: %~\a"}
		else
			precmd () {print -Pn "\e]0;%2~\a"}
		fi
		;;
esac

setopt appendhistory histignorespace histignorealldups histnostore histreduceblanks histsavenodups incappendhistorytime

# Search backwards and forwards with a pattern
bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M vicmd '?' history-incremental-pattern-search-forward

# set up for insert mode too
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5c' forward-word
bindkey '^[[1;5C' forward-word

# Help from Arch

autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
alias help=run-help

setopt completealiases

[[ -f ~/devel/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/devel/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh
[[ -f /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
[[ -d ~/bin ]] && export PATH="$HOME/bin:$PATH"

ssht () {
	ssh -Xt "$@" byobu
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

[[ $COLORTERM = gnome-terminal && ! $TERM = screen-256color ]] && TERM=xterm-256color
[[ -n $DISPLAY ]] && synclient TapButton1=1 TapButton2=3 TapButton3=2 CircularScrolling=1
export CDPATH="$CDPATH:$HOME"
