# List cached commands
function _initcache_list --description "List cached command names"
    if not test -d $initcache_directory
        _initcache_echo_preset error "no cache directory found"
        return 1
    end

    for file in $initcache_directory/*.fish
        echo (path basename --no-extension $file)
    end
end
