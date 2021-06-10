bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word

BREW_PREFIX=$(brew --prefix)

if typeset -f pathmunge > /dev/null
then
	pathmunge $BREW_PREFIX/opt/*/libexec/gnubin ~/Library/Python/*/bin(N) $BREW_PREFIX/opt/go/libexec/bin ${GOPATH:-~/dev/go}/bin $BREW_PREFIX/opt/m4/bin /Library/TeX/texbin
fi

for i in $BREW_PREFIX/opt/*/libexec/gnuman
do
	MANPATH="$i:$MANPATH"
done
export MANPATH

[[ -f ~/.zsh/iterm.zsh ]] && [[ $TERM_PROGRAM = iTerm.app ]] &&
	. ~/.zsh/iterm.zsh

for f in "$BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" "$BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
do
	[[ -f $f ]] && source $f
done

autoload -U +X bashcompinit && bashcompinit

unset 'FAST_HIGHLIGHT[chroma-man]'

alias top=htop

s () {
	saml_profile=${1:-${SAML?SAML profile not set}}
	saml2aws login -a "$saml_profile"
	export SAML=$saml_profile
	exec saml2aws exec -a "$saml_profile" -- zsh -l
}

precmd () (
	if (( SHLVL > 1 ))
	then
		pl1=("[%F{white}$SHLVL%f]")
	fi
	if [[ -n $AWS_PROFILE ]]
	then
		pl1+=("[%F{green}AWS%f: $AWS_PROFILE]")
		if [[ -n $SAML ]]
		then
			pl1+="[%F{cyan}SAML%f: $SAML]"
		fi
		if [[ -n $AWS_CREDENTIAL_EXPIRATION ]]
		then
			t=$(date -d "$AWS_CREDENTIAL_EXPIRATION" +%s)
			n=$(date +%s)
			pl1+=("[%F{cyan}Expiry%f: $((t - n))]")
		fi
	fi
	pl1=${${${pl1[*]//\[/%F{magenta}[%f}//]/%F{magenta}]%f}//|/%F{yellow}|%f}
	if [[ -n $pl1 ]]
	then
		print -Pl "\n$pl1"
	fi
)


#if command -v kubectl > /dev/null
#then
#	if command -v kustomize > /dev/null
#	then
#		complete -o nospace -C $BREW_PREFIX/bin/kustomize kustomize
#	fi
#	if false # kubectl config get-contexts -o name | grep -q .
#	then
#		declare -A contexts
#		while read context
#		do
#			case $context in
#				*aws*stg*) contexts[stgaws]=$context ;;
#				*gke*stg*) contexts[stggke]=$context ;;
#				*aws*prod*) contexts[stgprod]=$context ;;
#				*gke*sunlit*) contexts[stggke]=$context ;;
#				*gke*dev*) contexts[dev]=$context ;;
#			esac
#		done < <(kubectl config get-contexts -o name)
#
#		precmd () {
#			print -Pl "%F{magenta}[%B$(kubectl config current-context)%b%F{magenta}${K8S_NAMESPACE+%F{blue\}|%F{green\}$K8S_NAMESPACE}%F{magenta}]%f"
#		}
#	fi
#
#	klog () (
#		set -e
#		name=$1
#		shift
#		pod=$(kubectl get -n "${K8S_NAMESPACE:?}" pods -l "name == $name" --field-selector status.phase=Running -o name)
#		kubectl -n "${K8S_NAMESPACE:?}" logs "${pod:?}" "$@"
#	)
#fi

# From https://stackoverflow.com/a/42265848
export GPG_TTY=$(tty)

eval "$(saml2aws --completion-script-zsh)"
