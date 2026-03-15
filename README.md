# kitty-clean-config

A clean, modular [Kitty terminal](https://sw.kovidgoyal.net/kitty/) configuration for vim users on macOS.

<img width="1456" alt="Screenshot 2567-09-13 at 11 09 18" src="https://github.com/user-attachments/assets/b5a6e6ac-dfc0-42a2-b0d7-09fcaac018e5">

## Features

- Modular config split into focused `.conf` files
- Vim-style navigation (`h`/`l`) for tabs and windows
- Custom dark color scheme
- Powerline-style tab bar (top edge, slanted)
- SauceCodePro Nerd Font with tuned underline/cell spacing
- Remote control enabled with clipboard read/write
- Custom app icon included

## Installation

```bash
git clone https://github.com/<your-username>/kitty-clean-config.git
cd kitty-clean-config
bash install.sh
```

This creates a symlink from the repo to `~/.config/kitty`. Restart Kitty after installing.

## Config Structure

| File | Purpose |
|------|---------|
| `kitty.conf` | Entry point — includes all other configs |
| `general.conf` | Shell, ligatures, macOS behavior, remote control |
| `window.conf` | Window size, decorations, tab bar style |
| `cursor.conf` | Cursor shape, blink, thickness |
| `font.conf` | Font family, size, cell tweaks |
| `theme.conf` | Custom 16-color dark palette |
| `keymap.conf` | Vim-style key bindings |
| `startup.conf` | Session layout (tall) |

## Key Bindings

| Shortcut | Action |
|----------|--------|
| `cmd+h` / `cmd+l` | Previous / next tab |
| `ctrl+cmd+h` / `ctrl+cmd+l` | Move tab backward / forward |
| `cmd+1` - `cmd+9` | Go to tab by number |
| `cmd+shift+h` / `cmd+shift+l` | Previous / next window |

## Custom Icon

Replace the default Kitty icon by copying `kitty.app.icns` to `/Applications/kitty.app/Contents/Resources/`.
