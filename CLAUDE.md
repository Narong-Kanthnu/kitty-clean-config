# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A clean, modular kitty terminal configuration aimed at vim users on macOS. The config is split into focused `.conf` files, all included from the main `kitty.conf` entry point.

## Installation

```bash
# Symlinks the repo to ~/.config/kitty
bash install.sh
```

The install script creates a symlink from the repo directory to `~/.config/kitty`. Kitty must be restarted after installation.

## Architecture

`kitty.conf` is the entry point — it includes all other config files and sets the startup session:

- **general.conf** — Shell (zsh --login), ligatures, shell integration, macOS behavior, remote control, clipboard
- **window.conf** — Window size/decorations (titlebar-only), padding/margins, tab bar (powerline style, top edge)
- **cursor.conf** — Cursor shape (block), blink, thickness
- **font.conf** — Font family (SauceCodePro Nerd Font), size, underline/cell tweaks
- **theme.conf** — Custom color scheme (dark background #2A2A2A, custom 16-color palette)
- **keymap.conf** — Key bindings using vim-style h/l for tab/window navigation (cmd+h/l for tabs, cmd+shift+h/l for windows, cmd+1-9 for direct tab access)
- **startup.conf** — Session layout (tall)

## Key Design Decisions

- macOS-specific: uses `cmd` modifier for keybindings, `macos_quit_when_last_window_closed yes`
- Vim-oriented navigation: h/l keys for previous/next instead of default kitty bindings
- Remote control enabled (`allow_remote_control yes`) with clipboard read/write access
- Custom icon included (`kitty.app.icns`)
- `kitty.conf.md` is the full kitty documentation reference, not a config file
