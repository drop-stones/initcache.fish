function _initcache_register --description "Queue a command for cache validation"
    # Append command to global pending queue
    set -ga _initcache_pending "$argv"

    # Initialize prompt counter if unset
    if not set -q _initcache_prompt_count
        set -g _initcache_prompt_count 0
    end

    # Install on-prompt hook only once
    functions -q _initcache_on_prompt; and return

    function _initcache_on_prompt --on-event fish_prompt
        # Count prompts; skip the first for fast startup
        set -g _initcache_prompt_count (math $_initcache_prompt_count + 1)
        if test $_initcache_prompt_count -eq 1
            return
        end

        if set -q _initcache_pending[1]
            # Process one pending task in background
            set task $_initcache_pending[1]
            set -e _initcache_pending[1]
            fish -c "_initcache_background (string escape -- $task)" &
        else
            # Clean up when queue is empty
            functions -e _initcache_on_prompt
            set -e _initcache_prompt_count
            set -e _initcache_pending
        end
    end
end
