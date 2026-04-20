# ─────────────────────────────────────────────────────────────────────────────
# Environment Variables
# ─────────────────────────────────────────────────────────────────────────────

# Locale
export LANG=en_US.UTF-8

# Terminal
export TERM="xterm-256color"
export TERMINFO=/opt/homebrew/opt/ncurses/share/terminfo

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
# Homebrew (must be initialized before custom PATH entries)
# ─────────────────────────────────────────────────────────────────────────────

# Initialize Homebrew first - this calls path_helper internally
# which resets PATH, so our custom paths must come AFTER this
if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
export HOMEBREW_NO_ENV_HINTS=1

# ─────────────────────────────────────────────────────────────────────────────
# Tool Installations
# ─────────────────────────────────────────────────────────────────────────────

export NVM_DIR="$HOME/.nvm"
export PNPM_HOME="$HOME/Library/pnpm"

# ─────────────────────────────────────────────────────────────────────────────
# SSL Certificate (Python)
# ─────────────────────────────────────────────────────────────────────────────

unset SSL_CERT_FILE
{ _certifi=$("$HOME/miniconda3/bin/python3" -m certifi 2>/dev/null) && [[ -f "$_certifi" ]] && export SSL_CERT_FILE="$_certifi"; unset _certifi; }

# ─────────────────────────────────────────────────────────────────────────────
# Man Pages
# ─────────────────────────────────────────────────────────────────────────────

export MANWIDTH=999
