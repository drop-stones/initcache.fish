# Source a cached initialization script, creating or updating the cache if needed
function _initcache_source --description "Source cached initialization script"
    set -f base (path basename --no-extension $argv[1])
    set -f cachefile $initcache_directory/$base.fish

    # If cache does not exist, create and source it
    if not test -f $cachefile
        _initcache_update $argv; or return 1
        source $cachefile
        return 0
    end

    # If cache exists, source it
    source $cachefile

    # Validate cache in background: regenerate if output has changed
    _initcache_register $argv
end
