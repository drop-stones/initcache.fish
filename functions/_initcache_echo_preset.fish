function _initcache_echo_preset --description "Print with preset colors"
    argparse n -- $argv; or return 1

    set -f preset $argv[1]
    set -f rest $argv[2..-1]
    set -f echo_opt

    if set -q _flag_n
        set echo_opt -e -n
    end

    switch $preset
        case header
            _initcache_echo $echo_opt -c "blue --bold" $rest
        case command
            _initcache_echo $echo_opt -c green $rest
        case error
            printf "\e[1;31merror\e[0m" >&2 # always print red "error"
            echo -n ": " >&2
            for message in $rest
                echo $echo_opt $message >&2
            end
        case warning
            _initcache_echo $echo_opt -c "yellow --bold" $rest
        case info
            _initcache_echo -e -n -c cyan INFO
            echo -n ": "
            for message in $rest
                echo $echo_opt $message
            end
        case '*'
            _initcache_echo $echo_opt $rest
    end
end
