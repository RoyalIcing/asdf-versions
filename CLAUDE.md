# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an asdf version management system that centralizes tool version specifications in `config.makefile`. It automates installation and global configuration of development tools including programming languages, databases, and utilities.

## Key Files

- `config.makefile`: Central configuration file containing version specifications for all tools
- `Makefile`: Main automation logic for installation, updates, and global configuration
- `README.md`: Basic usage documentation

## Common Commands

### Install all tools and set globals
```bash
make
```
This pulls latest changes, installs all specified tool versions in parallel, sets global versions, and installs additional utilities.

### List current vs latest versions
```bash
make list          # Show installed versions
make latest        # Show latest available versions
```

### Update a specific tool
Use the `update_<tool>` pattern:
```bash
make update_erlang
make update_ruby
make update_gleam
```
This automatically updates the tool plugin, copies the latest version to clipboard, opens the config file for editing, installs the new version, and commits the change.

### Get latest version of a tool
```bash
asdf latest <tool>  # e.g., asdf latest deno
```

## Architecture

The system uses a two-file approach:
1. `config.makefile` defines version variables (e.g., `ruby_versions := 3.4.4`)
2. `Makefile` includes the config and generates dynamic targets for each tool/version combination

Key features:
- Parallel installation (`-j 10`) for performance
- Architecture-specific handling (arm64 vs x86_64) for problematic tools
- Special build configurations for Erlang and Postgres
- Automatic plugin management and updates
- Global version setting using the first version in each list
- Additional utility installation (cargo tools, pip packages, npm globals)

## Tool Management

Tools are managed through the `names` variable in the Makefile. Each tool has:
- A corresponding `<tool>_versions` variable in config.makefile
- Auto-generated install tasks (`<tool>_<version>`)
- Auto-generated update tasks (`update_<tool>`)
- Global version setting (uses first version in list)

When updating versions in config.makefile, maintain the existing format and use space-separated lists for multiple versions.