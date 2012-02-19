#!/bin/bash

export PATH="${PATH}:/sbin:/usr/sbin:/usr/local/sbin"
export EDITOR=nano
export HISTCONTROL=ignoredups # don't put duplicate lines in the history. See bash(1) for more options.
export CVS_RSH=ssh # required to do cvs using ssh.
