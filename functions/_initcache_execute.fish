# Execute a command safely and capture its output
# Prints output on success, returns non-zero on failure
function _initcache_execute --description "Execute command safely and capture output"
    set -f cmd (path basename --no-extension $argv[1])

    if not type -q $cmd
        _initcache_echo error "'$cmd' command not found"
        return 1
    end

    # save as a single string to preserve newlines
    set -f output (command $argv 2>/dev/null | string collect)

    if test $status -ne 0
        _initcache_echo error "'$argv' failed with exit code $status"
        return 1
    end

    echo $output
end
