# =============================================================================
# Aliases
# =============================================================================

# -----------------------------------------------------------------------------
# Core Utils
# -----------------------------------------------------------------------------
alias grep='grep --color=auto'

# Confirm before overwriting
alias rm="rm -i"

# Use rsync with progress for copying/moving
alias cp="rsync -ah --progress"

# -----------------------------------------------------------------------------
# Navigation
# -----------------------------------------------------------------------------
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

# -----------------------------------------------------------------------------
# Directory Listing (using eza)
# -----------------------------------------------------------------------------
alias l="eza -la --git --group-directories-first --color=always"
alias ll="l"
alias la="l"
alias ls="l"

# -----------------------------------------------------------------------------
# File Operations
# -----------------------------------------------------------------------------
alias cat="bat"

# -----------------------------------------------------------------------------
# Editor
# -----------------------------------------------------------------------------
alias vim="nvim"

# -----------------------------------------------------------------------------
# Clear Screen (typo-proof)
# -----------------------------------------------------------------------------
alias c="clear"
alias cl="clear"
alias cla="clear"
alias clar="clear"
alias clare="clear"
alias clea="clear"
alias clear="clear"
alias clr="clear"
alias clrae="clear"
alias clrea="clear"
alias cls="clear"

# -----------------------------------------------------------------------------
# Git
# -----------------------------------------------------------------------------
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gcsm="git commit -S -m"
alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"
alias gds="gd --staged"
alias gl="git log --graph --all --pretty=format:'%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n'"
alias gp="git push"
alias gss="git status --short"
alias gsw="git switch"
alias gu="git pull"
alias gur="git pull --no-rebase"

# -----------------------------------------------------------------------------
# Zsh Config
# -----------------------------------------------------------------------------
alias zsource="source \$ZDOTDIR/.zshrc"
alias zsh-update-plugins="find \"\$ZDOTDIR/plugins\" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"
alias cc="claude --dangerously-skip-permissions"

# -----------------------------------------------------------------------------
# Claude Code
# -----------------------------------------------------------------------------
# Claudex: Claude Code backed by GPT (gpt-5.6-sol) via local VibeProxy
# Requires VibeProxy running on localhost:8317 (menu-bar status green)
alias claudex='ANTHROPIC_BASE_URL=http://localhost:8317 \
ANTHROPIC_AUTH_TOKEN=dummy-not-used \
ANTHROPIC_API_KEY= \
CLAUDE_CODE_SUBAGENT_MODEL=gpt-5.6-sol \
CLAUDE_CODE_ALWAYS_ENABLE_EFFORT=1 \
CLAUDE_CODE_MAX_TOOL_USE_CONCURRENCY=3 \
ENABLE_TOOL_SEARCH=false \
claude --model gpt-5.6-sol --dangerously-skip-permissions'

alias cimi='ANTHROPIC_BASE_URL=http://localhost:8317 \
ANTHROPIC_AUTH_TOKEN=dummy-not-used \
ANTHROPIC_API_KEY= \
CLAUDE_CODE_SUBAGENT_MODEL=kimi-k3 \
CLAUDE_CODE_ALWAYS_ENABLE_EFFORT=1 \
CLAUDE_CODE_MAX_TOOL_USE_CONCURRENCY=3 \
ENABLE_TOOL_SEARCH=false \
claude --model kimi-k3 --dangerously-skip-permissions'
# -----------------------------------------------------------------------------
# Utilities
# -----------------------------------------------------------------------------
