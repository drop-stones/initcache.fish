# initcache.fish 🐟⚡

Cache external “init fish” output and source from cache for faster startup.

Replace this:

```fish
zoxide init fish | source
```

With this:

```fish
initcache source zoxide init fish
```

Cache once, source fast.

## 📦 Install

With [fisher](https://github.com/jorgebucaran/fisher):

```fish
fisher install drop-stones/initcache.fish
```

## 🚀 Usage

```text
initcache <command> [<target>] [<args>...]
```

Commands:

- `source`  Cache and source command output for a target
- `clear`   Clear cached entries (no target = all)
- `list`    List cached entries
- `update`  Refresh cache
- `help`    Show help for a command

> [!NOTE]
> More details and examples for each subcommand:
> `initcache help <command>`

## Configuration

By default, the cache directory is `~/.cache/initcache`.  
To use a custom location, set a universal variable:

```fish
set -U initcache_directory /path/to/your/initcache
```

> [!NOTE]
> The cache directory will be created on first use.
> So you don't need to create it manually.

## 🔄 Cache updates

This plugin not only sources cached initialization scripts, but also **keeps them up to date automatically**.

To reduce startup cost, cache validation and regeneration are **deferred**:

- When you call `initcache source ...`, the command is added to a pending queue.
- Each time a prompt is displayed, one pending command is processed **in the background**.
- As a result, your first prompt appears quickly, while caches are still refreshed behind the scenes.

This design achieves both:

- **Fast initialization** (immediate prompt)
- **Up-to-date caches** (background validation)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
