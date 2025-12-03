# vim-tmux-navigator stopped working

## Issue
Navigation from Neovim to tmux panes stopped working (could move from tmux to Neovim, but not Neovim to tmux).

## Date
December 3, 2025

## Environment
- macOS Tahoe 26.0.1
- tmux 3.5a
- Neovim with vim-tmux-navigator plugin

## Root cause
The `/private/tmp/tmux-501/` directory (which contains the tmux socket file) was deleted, likely by macOS temporary file cleanup. The tmux server continued running but couldn't communicate with vim-tmux-navigator because the socket file was missing.

The socket file is critical for vim-tmux-navigator to detect whether vim/neovim is running and coordinate navigation between tmux panes and vim splits.

## Fix
```bash
# Recreate the socket directory (replace 501 with your UID if different)
mkdir -p /private/tmp/tmux-501

# Signal tmux to recreate the socket file
kill -USR1 $(pgrep -o tmux)
```

Or as a one-liner:
```bash
mkdir -p /private/tmp/tmux-501 && kill -USR1 $(pgrep -o tmux)
```

## How to identify this issue
1. Navigation from vim to tmux doesn't work
2. TPM plugin updates fail with error: `returned 1`
3. Check if socket directory exists: `ls /private/tmp/tmux-$(id -u)/`
4. If directory is missing, this is the issue

## Prevention
This appears to be related to macOS temporary file cleanup. No permanent prevention is known, but the fix is quick and non-destructive.

## Additional notes
- The tmux-side vim-tmux-navigator plugin in `~/.tmux/plugins/vim-tmux-navigator/` was also very outdated (Nov 2022 vs July 2025 on the Neovim side), but updating it was not necessary to fix the immediate issue
- Consider updating the tmux-side plugin when convenient: `cd ~/.tmux/plugins/vim-tmux-navigator && git pull`
