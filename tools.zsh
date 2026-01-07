# =============================================================================
# External Tools Integration
# =============================================================================

# -----------------------------------------------------------------------------
# Homebrew
# -----------------------------------------------------------------------------
if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
export HOMEBREW_NO_ENV_HINTS=1

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
# Bun
# -----------------------------------------------------------------------------
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# -----------------------------------------------------------------------------
# OrbStack
# -----------------------------------------------------------------------------
[[ -f "$HOME/.orbstack/shell/init.zsh" ]] && source "$HOME/.orbstack/shell/init.zsh" 2>/dev/null

# -----------------------------------------------------------------------------
# Claude CLI
# -----------------------------------------------------------------------------
[[ -x "$HOME/.claude/local/claude" ]] && alias claude="$HOME/.claude/local/claude"
