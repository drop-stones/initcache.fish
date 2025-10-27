function _initcache_background --description "Validate and refresh cache file if outdated"
    # Derive cache file path from first argument
    set -f base (path basename --no-extension $argv[1])
    set -f cachefile $initcache_directory/$base.fish

    # Compare existing cache with fresh output
    set -f cached (string collect --allow-empty < $cachefile)
    set -f actual (_initcache_execute $argv); or return 1

    # Refresh if the cache is stale
    if test "$actual" != "$cached"
        _initcache_update $argv
    end
end
