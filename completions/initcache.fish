# All subcommands
set -l commands source clear list update help

# subcommands
complete --command initcache --condition "not __fish_seen_subcommand_from $commands" --no-files --arguments source --description "Cache and source command output"
complete --command initcache --condition "not __fish_seen_subcommand_from $commands" --no-files --arguments clear --description "Clear cached entries"
complete --command initcache --condition "not __fish_seen_subcommand_from $commands" --no-files --arguments list --description "List cached entries"
complete --command initcache --condition "not __fish_seen_subcommand_from $commands" --no-files --arguments update --description "Refresh cache"
complete --command initcache --condition "not __fish_seen_subcommand_from $commands" --no-files --arguments help --description "Show help for a command"

# source: suggest all available commands
complete --command initcache --condition "__fish_seen_subcommand_from source; and test (count (commandline -xpc)) -eq 2" \
    --no-files \
    --arguments "(__fish_complete_command)" \
    --description "Command to cache and source"

complete --command initcache --condition "__fish_seen_subcommand_from source; and test (count (commandline -xpc)) -ge 3" \
    --no-files \
    --arguments "(_initcache_delegate_complete 3)"

# clear: suggest cached targets
complete --command initcache --condition "__fish_seen_subcommand_from clear" \
    --no-files \
    --arguments "(_initcache_unused_from 3 (initcache list))" \
    --description "Targets to clear (default: all)"

# list: no arguments
complete --command initcache --condition "__fish_seen_subcommand_from list" --no-files

# update: suggest cached targets
complete --command initcache --condition "__fish_seen_subcommand_from update; and test (count (commandline -xpc)) -eq 2" \
    --no-files \
    --arguments "(initcache list)" \
    --description "Command to refresh cache"

complete --command initcache --condition "__fish_seen_subcommand_from update; and test (count (commandline -xpc)) -ge 3" \
    --no-files \
    --arguments "(_initcache_delegate_complete 3)"

# help: suggest all subcommands
complete --command initcache --condition "__fish_seen_subcommand_from help" \
    --no-files \
    --arguments "(string match --invert help $commands)" \
    --description "Subcommand to show help"
