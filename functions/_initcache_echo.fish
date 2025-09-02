function _initcache_echo --description "Print message with optional color, only if stdout is a TTY"
    set -f color_opts
    set -f echo_opts
    set -f output stdout
    set -f message

    argparse "c/color=" "e/echo=" "o/output=" -- $argv; or return 1
    set message $argv

    if set -q _flag_color
        set color_opts (string split " " $_flag_color)
    end

    if set -q _flag_echo
        set echo_opts (string split " " -- $_flag_echo)
    end

    if set -q _flag_output
        set output $_flag_output
    end

    set -f out_fd 1
    if test $output = stderr
        set out_fd 2
    end

    if isatty $out_fd
        if test (count $color_opts) -gt 0
            set_color $color_opts
        end
        echo $echo_opts $message >&$out_fd
        set_color normal
    else
        echo $echo_opts $message >&$out_fd
    end
end
