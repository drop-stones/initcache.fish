# Remove cached files (all or specific commands)
function _initcache_remove --description "Remove cache files"
    # If stdin is a pipe (not a TTY), append lines to argv.
    if not isatty stdin
        read --local --null --list stdin
        set --append argv $stdin
    end

    if test (count $argv) -eq 0
        _initcache_echo error "command is required"
        _initcache_echo usage remove
    end

    for cmd in $argv
        set -f file $initcache_directory/(path basename --no-extension $cmd).fish
        if test -f $file
            rm -f $file
        else
            _initcache_echo error "no cache found for '$cmd'"
            _initcache_echo usage remove
            return 1
        end
    end
end
