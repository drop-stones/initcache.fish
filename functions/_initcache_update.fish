# Create or update a cache file from a command's output
function _initcache_update --description "Update cache file from command output"
    set -f tmp (mktemp)
    _initcache_execute $argv >$tmp; or return 1

    set -f base (path basename --no-extension $argv[1])
    set -f cachefile $initcache_directory/$base.fish
    mv $tmp $cachefile
end
