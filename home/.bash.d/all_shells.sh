#!/bin/bash

export PATH="/bin:/usr/bin:/usr/local/bin"

export GEM_HOME="${HOME}/.gem"
mkdir -p "${GEM_HOME}"
export PATH="${PATH}:${GEM_HOME}/bin"

if [[ -s "${HOME}/.rvm/scripts/rvm" ]]
then
    # Load RVM into a shell session *as a function*
    source "${HOME}/.rvm/scripts/rvm"
elif [[ -d "${HOME}/.rbenv" ]]
then
    export PATH="${HOME}/.rbenv/bin:${PATH}"
    eval "$(rbenv init -)"
fi
