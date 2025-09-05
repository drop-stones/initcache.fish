# initcache.fish 🐟⚡

A Fish shell plugin that caches external command initialization output for faster shell startup and easier management.

## 🎯 What it does

Many tools like `zoxide`, `starship`, `mise`, etc. require you to run initialization commands that generate shell code:

```fish
# Traditional approach: slow and manual
zoxide init fish | source
starship init fish | source
mise activate fish | source
```

**initcache.fish** provides two key benefits:

1. **⚡ Performance**: Sources from cache instead of running commands every startup
2. **🛠️ Management**: Automatic cache updates vs manual file maintenance

```fish
# With initcache: fast and automatic
initcache source zoxide init fish
initcache source starship init fish
initcache source mise activate fish
```

## 📦 Installation

With [fisher](https://github.com/jorgebucaran/fisher):

```fish
fisher install drop-stones/initcache.fish
```

## 🚀 Usage

### Basic syntax

```fish
initcache <command> [<target>] [<args>...]
```

### `source`

Cache and source command output for faster subsequent loads.

```fish
initcache source <target> <args>...
```

**Examples:**

```fish
initcache source zoxide init fish
initcache source starship init fish
initcache source mise activate fish
```

> [!TIP]
> Replace your existing `| source` commands with `initcache source` in your `config.fish`.

### `list`

Show all cached entries.

```fish
initcache list
```

### `update`

Force refresh cache for a specific target.

```fish
initcache update <target> <args>...
```

**Examples:**

```fish
initcache update zoxide init fish
initcache update starship init fish
initcache update mise activate fish
```

### `remove` command

Remove cached entries.

```fish
initcache remove [<target> ...]
```

**Examples:**

```fish
# Remove specific cache
initcache remove zoxide

# Remove all caches
initcache list | initcache remove
```

### `help` command

Get detailed help for commands.

```fish
initcache help [<command>]
```

**Examples:**

```fish
initcache help           # General help
initcache help source    # Help for source command
```

## ⚙️ Configuration

Cache directory (default: `~/.cache/initcache`):

```fish
set -U initcache_directory /path/to/your/cache
```

> [!NOTE]
> The cache directory is created automatically on first use.

## 🔄 Smart Cache Management

initcache.fish automatically keeps your caches up-to-date without slowing down shell startup:

1. **Immediate sourcing**: Cached output is sourced instantly
2. **Background validation**: Cache freshness is checked after your prompt appears
3. **Deferred updates**: Cache refreshes happen in the background
4. **Queue processing**: One pending update per prompt to minimize impact

This design ensures:

- ✅ **Fast shell startup** (immediate prompt)
- ✅ **Fresh caches** (automatic background updates)
- ✅ **Zero maintenance** (no manual file management)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
