# List cached commands
function _initcache_list --description "List cached command names"
    for file in $initcache_directory/*.fish
        echo (path basename --no-extension $file)
    end
end
