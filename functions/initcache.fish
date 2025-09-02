function initcache --description "Cache and source initialization scripts"
    argparse h/help -- $argv; or return 1

    if set -ql _flag_help
        set --prepend argv help
    end

    if test (count $argv) -eq 0
        _initcache_echo error "subcommand required"
        _initcache_echo usage
        return 1
    end

    # Ensure $initcache_directory is set and the directory exists
    _initcache_ensure_dir; or return 1

    set -f subcommand $argv[1]
    set -e argv[1]

    switch $subcommand
        case source
            _initcache_source $argv
        case remove
            _initcache_remove $argv
        case list
            _initcache_list $argv
        case update
            _initcache_update $argv
        case help
            _initcache_help $argv
        case '*'
            _initcache_echo error "unknown subcommand '$subcommand'"
            _initcache_echo usage
            return 1
    end

    return $status
end
