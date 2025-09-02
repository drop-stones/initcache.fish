function _initcache_install --on-event initcache_install --description "Setup initcache: set cache directory path to universal variables"
    set --universal initcache_directory $HOME/.cache/initcache
end

function _initcache_uninstall --on-event initcache_uninstall --description "Teardown initcache: erase universal variables"
    # Remove all cached files
    initcache list | initcache remove

    # Remove cache directory if it is empty
    test -d "$initcache_directory" && command rmdir --ignore-fail-on-non-empty "$initcache_directory"

    set --erase initcache_directory
end
