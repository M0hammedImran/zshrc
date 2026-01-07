# ─────────────────────────────────────────────────────────────────────────────
# Environment Variables
# ─────────────────────────────────────────────────────────────────────────────

# Locale
export LANG=en_US.UTF-8

# Terminal
export TERM="xterm-256color"

# Editors
export EDITOR='zed'
export VISUAL='zed'

# Shell
export SHELL='/bin/zsh'

# ─────────────────────────────────────────────────────────────────────────────
# History
# ─────────────────────────────────────────────────────────────────────────────

export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000

# ─────────────────────────────────────────────────────────────────────────────
# Homebrew
# ─────────────────────────────────────────────────────────────────────────────

export HOMEBREW_NO_ENV_HINTS=1

# ─────────────────────────────────────────────────────────────────────────────
# Tool Installations
# ─────────────────────────────────────────────────────────────────────────────

export BUN_INSTALL="$HOME/.bun"
export CARGO_INSTALL="$HOME/.cargo"
export NVIM_INSTALL="/opt/nvim"
export GO_BIN="$HOME/go/bin"
export MINICONDA_BIN="$HOME/miniconda3/bin"
export NVM_DIR="$HOME/.nvm"
export PNPM_HOME="$HOME/Library/pnpm"

# ─────────────────────────────────────────────────────────────────────────────
# SSL Certificate (Python)
# ─────────────────────────────────────────────────────────────────────────────

export SSL_CERT_FILE=$(python3 -m certifi 2>/dev/null)

# ─────────────────────────────────────────────────────────────────────────────
# Man Pages
# ─────────────────────────────────────────────────────────────────────────────

export MANWIDTH=999

# ─────────────────────────────────────────────────────────────────────────────
# PATH
# ─────────────────────────────────────────────────────────────────────────────

typeset -U path  # Ensure unique entries in PATH

path=(
    "$HOME/.local/bin"
    "$CARGO_INSTALL/bin"
    "$BUN_INSTALL/bin"
    "$NVIM_INSTALL/bin"
    "$GO_BIN"
    "$MINICONDA_BIN"
    "$PNPM_HOME"
    $path
)

export PATH
