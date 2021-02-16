bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word

BREW_PREFIX=$(brew --prefix)
#eval "$(chef shell-init zsh)"
pathmunge $BREW_PREFIX/opt/*/libexec/gnubin ~/Library/Python/*/bin(N) $BREW_PREFIX/opt/go/libexec/bin ${GOPATH:-~/go}/bin $BREW_PREFIX/opt/m4/bin /Library/TeX/texbin

for i in $BREW_PREFIX/opt/*/libexec/gnuman
do
	MANPATH="$i:$MANPATH"
done
export MANPATH

fpath=($BREW_PREFIX/share/zsh-completions $fpath)

[[ -f ~/.zsh/iterm.zsh ]] && [[ $TERM_PROGRAM = iTerm.app ]] &&
	. ~/.zsh/iterm.zsh

export CLOUDSDK_PYTHON="/usr/local/opt/python@3.8/libexec/bin/python"
for f in "$BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" "$BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
do
	[[ -f $f ]] && source $f
done

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $BREW_PREFIX/bin/kustomize kustomize

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
	print -Pl "%F{magenta}[%B$(kubectl config current-context)%b%F{magenta}${K8S_NAMESPACE+%F{blue\}|%F{green\}$K8S_NAMESPACE}%F{magenta}]%f"
}

klog () (
	set -e
	name=$1
	shift
	pod=$(kubectl get -n "${K8S_NAMESPACE:?}" pods -l "name == $name" --field-selector status.phase=Running -o name)
	kubectl -n "${K8S_NAMESPACE:?}" logs "${pod:?}" "$@"
)

alias top=htop
