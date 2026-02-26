# Scripts

A repository for my configuration and script files. I use Vim with various plugins and tmux heavily, so these dotfiles are kept here for reference and portability.

Feel free to re-use and submit pull requests.

---

## Files

| File | Description |
|------|-------------|
| `bashrc` | Bash shell configuration |
| `vimrc` | Vim editor configuration |
| `tmux.conf` | Tmux terminal multiplexer configuration (Pi 5) |

---

## Tmux Setup

### Step 1: Install tmux

```bash
sudo apt install tmux
```

### Step 2: Link the config

```bash
ln -sf ~/projects/Scripts/tmux.conf ~/.tmux.conf
```

### Step 3: Install TPM (Tmux Plugin Manager)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Step 4: Install plugins

Open tmux and press:

```
Ctrl+a then I   (capital I)
```

Wait for "TMUX environment reloaded" message.

### Step 5: Reload config (after edits)

Inside tmux, press:

```
Ctrl+a then r
```

### Step 6: Essential keybindings

| Action | Keys |
|--------|------|
| **Prefix** (before all commands) | `Ctrl+a` |
| Split horizontal | `Ctrl+a` then `\|` |
| Split vertical | `Ctrl+a` then `-` |
| Navigate panes | `Ctrl+a` then `h/j/k/l` |
| Resize panes | `Ctrl+a` then `H/J/K/L` |
| New window | `Ctrl+a` then `c` |
| Next/prev window | `Ctrl+a` then `n/p` |
| Detach (leave running) | `Ctrl+a` then `d` |
| Reload config | `Ctrl+a` then `r` |
| Enter copy mode | `Ctrl+a` then `[` |
| Exit copy mode | `q` |
| Kill pane | `Ctrl+a` then `x` |

### Step 7: Auto-start session (optional)

Add to `~/.bashrc` so tmux starts on login:

```bash
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi
```

### Plugins included

- **tmux-sensible** — sensible defaults
- **tmux-resurrect** — save/restore sessions across restarts
- **tmux-continuum** — automatic session saving (every 15 min)
