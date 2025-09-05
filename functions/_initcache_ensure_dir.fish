function _initcache_ensure_dir -d "Ensure that the cache directory exists"
    if not set -q initcache_directory
        set --universal initcache_directory $HOME/.cache/initcache
    end

    if not test -d $initcache_directory
        mkdir -p $initcache_directory
        or _initcache_echo error "Failed to create cache directory '$initcache_directory'."
        return 1
    end
end
