export PATH=$PATH:/usr/local/bin:/usr/local/mysql/bin/:/usr/local/sbin

alias ls='gls --color=auto'
alias sed='gsed'
#also, make nano not auto line wrap!
alias nano='nano -w'
alias n='nano'
#i don't care for vi
export EDITOR=nano

# If this is an xterm set the title to user@host:dir
case $TERM in
    ansi|vt100|linux)
        #set a fancier prompt
        PS1="\033[46;1;34m\u@\h:\w\$ \033[0m"
        ;;
    xterm|rxvt-unicode|rxvt)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
        PS1="\u@\h:\w\$ "
        ;;
    dumb)
       #if we're using a dumb (e.g. M-x shell) terminal, purge a couple things
       PS1='\u@\h:\w\$ '
       alias ls='ls --color=never'
        ;;
esac

# load rvm
[[ -s "/Users/LCooper/.rvm/scripts/rvm" ]] && source "/Users/LCooper/.rvm/scripts/rvm"

# load completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
