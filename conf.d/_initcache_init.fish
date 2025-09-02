function _initcache_init_install --on-event _initcache_init_install --description "Setup initcache: set cache directory path to universal variables"
    set --universal initcache_directory $HOME/.cache/initcache
end

function _initcache_init_uninstall --on-event _initcache_init_uninstall --description "Teardown initcache: clear universal variables"
    set --erase initcache_directory
end
