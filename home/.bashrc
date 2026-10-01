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

    # Track files for safety and watch for filesystem write failures
    local PROCESSED_FILES=()
    local CACHE_BUILD_FAILED=0
    local ERROR_REASON=""

    if [[ ! -f "$CACHED_CONFIG" || -n "$(find -L ~/.bash.d -type f -name '*.sh' -newermm "${CACHED_CONFIG}")" ]]
    then
        local OS_TYPE=$(uname | tr 'A-Z' 'a-z')
        local HOST_NAME=$(hostname -s)
        local CONFIG_TYPES=( "" "localhost" "$HOST_NAME" "$OS_TYPE" )
        local CONFIG_NAMES=("${@}")

        # Test directory writability first; trap write failures
        if ! : > "$CACHED_CONFIG" 2>/dev/null; then
            CACHE_BUILD_FAILED=1
            ERROR_REASON="Cache file is not writable (directory may be read-only or out of space)."
        fi

        for CONFIG_NAME in "${CONFIG_NAMES[@]}"; do
            for CONFIG_TYPE in "${CONFIG_TYPES[@]}"; do

                if [[ -z "$CONFIG_TYPE" ]]; then
                    CONFIG_PATH="${HOME}/.bash.d/${CONFIG_NAME}.sh"
                else
                    CONFIG_PATH="${HOME}/.bash.d/${CONFIG_TYPE}/${CONFIG_NAME}.sh"
                fi

                if [[ -f "${CONFIG_PATH}" ]]; then
                    PROCESSED_FILES+=("$CONFIG_PATH")

                    if [[ $CACHE_BUILD_FAILED -eq 0 ]]; then
                        if ! cat "${CONFIG_PATH}" >> "$CACHED_CONFIG" 2>/dev/null; then
                            CACHE_BUILD_FAILED=1
                            ERROR_REASON="Failed to append configuration streams to the cache file."
                        fi
                        echo '' >> "$CACHED_CONFIG" 2>/dev/null
                    fi
                fi
            done
        done

        if [[ $CACHE_BUILD_FAILED -eq 0 ]]; then
            if ! sync "$CACHED_CONFIG" 2>/dev/null; then
                CACHE_BUILD_FAILED=1
                ERROR_REASON="Filesystem sync execution failed on cache generation."
            fi
        fi
    fi

    # Verify readability before declaring absolute success
    if [[ $CACHE_BUILD_FAILED -eq 0 && ! -r "$CACHED_CONFIG" ]]; then
        CACHE_BUILD_FAILED=1
        ERROR_REASON="Compiled cache target exists but is unreadable."
    fi

    # SUCCESS ROUTE
    if [[ $CACHE_BUILD_FAILED -eq 0 ]]; then
        source "$CACHED_CONFIG"
    else
        # FALLBACK ROUTE: Warn user via stderr and parse dynamically
        echo "bash_config_warning: Fallback route active. Configuration loading may be slower." >&2
        echo "Reason: ${ERROR_REASON:-Unknown cache generation conflict.}" >&2

        if [[ ${#PROCESSED_FILES[@]} -gt 0 ]]; then
            for SAFE_PATH in "${PROCESSED_FILES[@]}"; do
                source "$SAFE_PATH"
            done
        else
            # Deep discovery rebuild if cache metadata check tripped the initial failure path
            local OS_TYPE=$(uname | tr 'A-Z' 'a-z')
            local HOST_NAME=$(hostname -s)
            local CONFIG_TYPES=( "" "localhost" "$HOST_NAME" "$OS_TYPE" )
            for CONFIG_NAME in "${@}"; do
                for CONFIG_TYPE in "${CONFIG_TYPES[@]}"; do
                    CONFIG_PATH="${HOME}/.bash.d/${CONFIG_TYPE:+$CONFIG_TYPE/}${CONFIG_NAME}.sh"
                    [[ -f "${CONFIG_PATH}" ]] && source "$CONFIG_PATH"
                done
            done
        fi
    fi
}

# If running interactively, then:
if [ "${PS1}" ]
then
	load_cached_configuration interactive all_shells evals aliases exports completion terminal_types
else
    load_cached_configuration script all_shells
fi
