#!/bin/bash

export PATH="/bin:/usr/bin:/usr/local/bin"

export GEM_HOME="${HOME}/.gem"
mkdir -p "${GEM_HOME}"
export PATH="${PATH}:${GEM_HOME}/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
