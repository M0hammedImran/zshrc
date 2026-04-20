# =============================================================================
# External Tools Integration
# =============================================================================

# Note: Homebrew is initialized in exports.zsh before PATH setup

# -----------------------------------------------------------------------------
# Zoxide (smart cd)
# -----------------------------------------------------------------------------
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi

# -----------------------------------------------------------------------------
# Starship Prompt
# -----------------------------------------------------------------------------
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

# -----------------------------------------------------------------------------
# NVM (Node Version Manager)
# -----------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/zsh_completion" ]] && source "$NVM_DIR/zsh_completion"

# -----------------------------------------------------------------------------
# Deno
# -----------------------------------------------------------------------------
if [[ -d "$HOME/.deno" ]]; then
    [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]] && export FPATH="$HOME/.zsh/completions:$FPATH"
    [[ -f "$HOME/.deno/env" ]] && source "$HOME/.deno/env"
fi

# -----------------------------------------------------------------------------
# Cargo (Rust)
# -----------------------------------------------------------------------------
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# -----------------------------------------------------------------------------
# Conda / Miniconda
# -----------------------------------------------------------------------------
if [[ -d "$HOME/miniconda3" ]]; then
    __conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2>/dev/null)"
    if [[ $? -eq 0 ]]; then
        eval "$__conda_setup"
    else
        if [[ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]]; then
            source "$HOME/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="$HOME/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
fi

# -----------------------------------------------------------------------------
# pnpm
# -----------------------------------------------------------------------------
if [[ -d "$HOME/Library/pnpm" ]]; then
    export PNPM_HOME="$HOME/Library/pnpm"
    case ":$PATH:" in
        *":$PNPM_HOME:"*) ;;
        *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
fi

# -----------------------------------------------------------------------------
# OrbStack
# -----------------------------------------------------------------------------
[[ -f "$HOME/.orbstack/shell/init.zsh" ]] && source "$HOME/.orbstack/shell/init.zsh" 2>/dev/null


# -----------------------------------------------------------------------------
# Final PATH Setup (must come LAST after all tools that modify PATH)
# -----------------------------------------------------------------------------
# Re-add custom paths that may have been overwritten by tool initializations
# Using direct PATH manipulation since many tools use export PATH= which breaks the zsh path array
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.bun/bin:/opt/nvim/bin:$HOME/go/bin:$HOME/miniconda3/bin:$HOME/Library/pnpm:/opt/homebrew/opt/libpq/bin:$PATH"
