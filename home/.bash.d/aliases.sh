#!/bin/bash

alias nano='nano -w' # make nano not auto line wrap.
alias n='nano'
alias valentine='ssh -X rancor.homeunix.org'

# only alias ls if an override file hasn't already done so.
alias -p ls > /dev/null
if [ $? == 1 ]
then
    alias ls='ls --color=auto'
fi