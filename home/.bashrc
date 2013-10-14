# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#
# Load all configs of the given types from ~/.bash.d
# into the current shell. Will attempt to load from and write to
# ~/.bash.d/cache/, but should load config regardless.
# Example: When run on demeter, a Linux system,
# load_cached_configuration script aliases exports would load the following files
# if they exist in ~/.bash.d:
#   linux/aliases.sh
#   demeter/aliases.sh
#   localhost/aliases.sh
#   aliases.sh
#   linux/exports.sh
#   demeter/exports.sh
#   localhost/exports.sh
#   exports.sh
# It would also write the cachefile
# ~/.bash.d/cache/script.sh
#
load_cached_configuration() {
    SESSION_TYPE=$1
    shift 1
    CACHED_CONFIG="${HOME}/.bash.d/cache/${SESSION_TYPE}.sh"
    if [[ ! -f $CACHED_CONFIG || -n "$(find -L ~/.bash.d -newermm ${CACHED_CONFIG} '(' -type f -name '*.sh' -o -type d ')')" ]]
    then
	    CONFIG_TYPES=( `uname | tr 'A-Z' 'a-z'` `hostname -s` 'localhost' '' )
        CONFIG_NAMES=("${@}")
        rm -f $CACHED_CONFIG
        for CONFIG_TYPE in "${CONFIG_TYPES[@]}"
        do
	        for CONFIG_NAME in "${CONFIG_NAMES[@]}"
	        do
		        CONFIG_PATH="${HOME}/.bash.d/${CONFIG_TYPE}/${CONFIG_NAME}.sh"
		        if [ -f "${CONFIG_PATH}" ]
		        then
                    source $CONFIG_PATH
			        cat $CONFIG_PATH >> $CACHED_CONFIG
                    echo '' >> $CACHED_CONFIG # Ensure correctness regardless of trailing newline
		        fi
	        done
        done
    else
        source $CACHED_CONFIG
    fi
}

# If running interactively, then:
if [ "${PS1}" ]
then
	load_cached_configuration interactive all_shells evals aliases exports completion terminal_types
else
    load_cached_configuration script all_shells
fi
