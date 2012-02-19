#!/bin/bash

# Add enhanced completion for a folder containing a rails app and remove it when we leave the folder
cd () {
	command cd "$@";

	if [ -f ./Rakefile ]
	then
		complete -W "SAME AS YOURS above" rake
	else
		complete -r rake
	fi

	if [ -f ./Capfile ]
	then
		complete -W "$(cap -T | grep '#' | awk 'NR != 1 {print $2}')" cap
	else
		complete -r cap
	fi
}
