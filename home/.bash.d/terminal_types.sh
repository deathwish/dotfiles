#!/bin/bash

alias ls='ls --color=auto'
case $TERM in
	ansi|vt100|linux)
		PS1="\033[46;1;34m\u@\h:\w\$ \033[0m"
		;;
	xterm|rxvt-unicode|rxvt)
        # If this is an xterm set the title to user@host:dir
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
		PS1="\u@\h:\w\$ "
		;;
	*)
		#if we're using a dumb (e.g. M-x shell) terminal, purge a couple things
		PS1='\u@\h:\w\$ '
		alias ls='ls --color=never'
		;;
esac
