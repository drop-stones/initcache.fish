# All subcommands
set -l commands source remove list update help

# subcommands
complete --command initcache --condition "not __fish_seen_subcommand_from $commands" --no-files --arguments source --description "Cache and source command output"
complete --command initcache --condition "not __fish_seen_subcommand_from $commands" --no-files --arguments remove --description "Remove cached entries"
complete --command initcache --condition "not __fish_seen_subcommand_from $commands" --no-files --arguments list --description "List cached entries"
complete --command initcache --condition "not __fish_seen_subcommand_from $commands" --no-files --arguments update --description "Refresh cache"
complete --command initcache --condition "not __fish_seen_subcommand_from $commands" --no-files --arguments help --description "Show help for a command"

# source: suggest all available commands
complete --command initcache --condition "_initcache_at 2 source; and test (count (commandline -xpc)) -eq 2" \
    --no-files \
    --arguments "(__fish_complete_command)" \
    --description "Command to cache and source"

complete --command initcache --condition "_initcache_at 2 source; and test (count (commandline -xpc)) -ge 3" \
    --no-files \
    --arguments "(_initcache_delegate_complete 3)"

# remove: suggest cached targets
complete --command initcache --condition "_initcache_at 2 remove" \
    --no-files \
    --arguments "(_initcache_unused_from 3 (initcache list))" \
    --description "Targets to remove"

# list: no arguments
complete --command initcache --condition "_initcache_at 2 list" --no-files

# update: suggest cached targets
complete --command initcache --condition "_initcache_at 2 update; and test (count (commandline -xpc)) -eq 2" \
    --no-files \
    --arguments "(initcache list)" \
    --description "Command to refresh cache"

complete --command initcache --condition "_initcache_at 2 update; and test (count (commandline -xpc)) -ge 3" \
    --no-files \
    --arguments "(_initcache_delegate_complete 3)"

# help: suggest all subcommands
complete --command initcache --condition "_initcache_at 2 help; and test (count (commandline -xpc)) -eq 2" \
    --no-files \
    --arguments "(string match --invert help $commands)" \
    --description "Subcommand to show help"

complete --command initcache --condition "_initcache_at 2 help; and test (count (commandline -xpc)) -ge 3" --no-files
