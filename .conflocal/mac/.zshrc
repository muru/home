bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word

#eval "$(chef shell-init zsh)"
pathmunge /usr/local/opt/*/libexec/gnubin ~/Library/Python/*/bin(N) /usr/local/opt/go/libexec/bin ${GOPATH:-~/go}/bin /usr/local/opt/m4/bin /Library/TeX/texbin

for i in /usr/local/opt/*/libexec/gnuman
do
	MANPATH="$i:$MANPATH"
done
export MANPATH

export BYOBU_PREFIX=/usr/local
fpath=(/usr/local/share/zsh-completions $fpath)

[[ -f ~/.zsh/iterm.zsh ]] && [[ $TERM_PROGRAM = iTerm.app ]] &&
	. ~/.zsh/iterm.zsh


[[ -f $HOME/dev/google-cloud-sdk/completion.zsh.inc ]] && . $HOME/dev/google-cloud-sdk/completion.zsh.inc
[[ -f $HOME/dev/google-cloud-sdk/path.zsh.inc ]] && . $HOME/dev/google-cloud-sdk/path.zsh.inc
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/kustomize kustomize

unset 'FAST_HIGHLIGHT[chroma-man]'

declare -A contexts
while read context
do
	case $context in
		*aws*stg*) contexts[stgaws]=$context ;;
		*gke*stg*) contexts[stggke]=$context ;;
		*aws*prod*) contexts[stgprod]=$context ;;
		*gke*sunlit*) contexts[stggke]=$context ;;
		*gke*dev*) contexts[dev]=$context ;;
	esac
done < <(kubectl config get-contexts -o name)

precmd () {
	print -Pl "%F{magenta}[%B$(kubectl config current-context)%b%F{magenta}]%f"
}
