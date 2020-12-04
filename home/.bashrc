# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# set history length
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# colored promt with a red root user
if [ $(id -u) -eq 0 ]; then
	export PS1="\e[1;31m\u\e[1;37m@\e[1;34m\h\e[m\e[1;37m:\e[1;33m\w\e[m \e[1;36m$\e[m "
else
	export PS1="\e[1;32m\u\e[1;37m@\e[1;34m\h\e[m\e[1;37m:\e[1;33m\w\e[m \e[1;36m$\e[m "
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# load aliases
[ -f ~/.aliasrc ] && source ~/.aliasrc

# load environment
[ -f ~/.environmentrc ] && source ~/.environmentrc

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi
