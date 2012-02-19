# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#
# Source all configs of a given type from ~/.bash.d.
# Example: When run on demeter, a Linux system,
# source_config_for 'aliases' would load the following files
# if they exist in ~/.bash.d:
#   linux/aliases.sh
#   demeter/aliases.sh
#   localhost/aliases.sh
#   aliases.sh
#
source_config_for() {
	CONFIG_NAME=$1
	CONFIG_TYPES=( `uname | tr 'A-Z' 'a-z'` `hostname` 'localhost' '' )
	for CONFIG_TYPE in "${CONFIG_TYPES[@]}"
	do
		CONFIG_PATH="${HOME}/.bash.d/${CONFIG_TYPE}/${CONFIG_NAME}.sh"
		if [ -f "${CONFIG_PATH}" ]
		then
			source $CONFIG_PATH
		fi
	done
}

source_config_for 'all_shells'

# If running interactively, then:
if [ "${PS1}" ]
then
	source_config_for 'evals'
	source_config_for 'aliases'
	source_config_for 'exports'
	source_config_for 'completion'
	source_config_for 'terminal_types'
fi
