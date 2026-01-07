# ZSH Configuration Entry Point
# =============================

# Set ZDOTDIR if not already set
export ZDOTDIR="${ZDOTDIR:-$HOME/.config/zsh}"

# Helper function to source files if they exist
function source_if_exists() {
    [[ -f "$1" ]] && source "$1"
}

# Load configuration modules in order
source_if_exists "$ZDOTDIR/exports.zsh"     # Environment variables
source_if_exists "$ZDOTDIR/options.zsh"     # Shell options, keybindings, completions
source_if_exists "$ZDOTDIR/functions.zsh"   # Helper functions
source_if_exists "$ZDOTDIR/aliases.zsh"     # Aliases
source_if_exists "$ZDOTDIR/prompt.zsh"      # Prompt configuration
source_if_exists "$ZDOTDIR/plugins.zsh"     # Plugin management
source_if_exists "$ZDOTDIR/tools.zsh"       # External tool integrations
source_if_exists "$ZDOTDIR/secrets.zsh"     # Private tokens/keys (gitignored)
