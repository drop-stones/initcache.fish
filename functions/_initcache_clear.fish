# Clear cached files (all or specific commands)
function _initcache_clear --description "Clear cache files"
    if not test -d $initcache_directory
        _initcache_echo_preset error "no cache directory found"
        return 1
    end

    if test (count $argv) -eq 0
        # No args → clear all
        for file in $initcache_directory/*.fish
            rm -f $file
        end
        echo "All cache files cleared"
    else
        # Args → clear specific files
        for cmd in $argv
            set -f file $initcache_directory/(path basename --no-extension $cmd).fish
            if test -f $file
                rm -f $file
                echo "Cleared cache for '$cmd'"
            else
                _initcache_echo_preset error "no cache found for '$cmd'"
            end
        end
    end
end
