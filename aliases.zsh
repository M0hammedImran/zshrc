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
alias mv="rsync -ah --progress --remove-source-files"

# -----------------------------------------------------------------------------
# Navigation
# -----------------------------------------------------------------------------
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

# -----------------------------------------------------------------------------
# Directory Listing (using exa)
# -----------------------------------------------------------------------------
alias l="exa -la --git --group-directories-first --color=always --git-ignore"
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
# Utilities
# -----------------------------------------------------------------------------
