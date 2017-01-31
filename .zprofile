pathmunge() {
	local path_array before
	# The default is to prepend the argument to PATH
	before=1
	case $1 in
		after)
			before=
			;&
		before)
			shift
			;;
	esac
	# Split PATH on : into an array
	path_array=(${(As.:.)PATH})
	# Then remove the arguments from it, since they are to be added in the
	# order specified
	path_array=(${path_array:|argv})
	if [[ -n $before ]]
	then
		# Reverse the order of the arguments, so that:
		#    for f in ...; pathmunge f
		# and
		#    pathmunge ...
		# have the same effect.
		path_array=(${(Oa)argv} $path_array)
	else
		path_array=($path_array $argv)
	fi
	# Concatenate the array back to PATH
	export PATH="${(j.:.)path_array}"
}

[[ -n $GOPATH ]] && pathmunge "$GOPATH/bin"
[[ -d $HOME/bin ]] && pathmunge $HOME/bin
export EDITOR=vim
