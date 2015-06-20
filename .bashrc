#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:~/bin
alias ls='ls --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Start X on one of the first three VTs
#alias startx='startx &> ~/.xlog'
#[[ -z $DISPLAY && -n $XDG_VTNR && $XDG_VTNR -lt 3 ]] && exec startx ~/.xinitrc gnome-shell

export DEBEMAIL="murukesh@cse.iitb.ac.in"
export DEBFULLNAME="Murukesh Mohanan"

#. ~/devel/cs715/paths.sh

[[ -n $DISPLAY ]] && synclient TapButton1=1 TapButton2=2 TapButton3=3 CircularScrolling=1
