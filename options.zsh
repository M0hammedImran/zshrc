# =============================================================================
# Shell Options
# =============================================================================

# Disable beeping
unsetopt BEEP

# Don't highlight pasted text
zle_highlight=('paste:none')

# =============================================================================
# Keybindings
# =============================================================================

# Use emacs keybindings
bindkey -e

# Ctrl+U - delete from cursor to beginning of line
bindkey \^u backward-kill-line

# Ctrl+Arrow keys - move by word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Alt+Arrow keys - move by word (alternative)
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word

# History search with up/down arrows
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# =============================================================================
# Completions
# =============================================================================

autoload -Uz compinit

# Only regenerate compinit once a day for performance
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Case-insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Menu selection for completions
zstyle ':completion:*' menu select
zstyle ':completion::complete:lsof:*' menu yes select

# Load completion module
zmodload zsh/complist

# Include hidden files in completion
_comp_options+=(globdots)

# =============================================================================
# Colors
# =============================================================================

autoload -Uz colors && colors
