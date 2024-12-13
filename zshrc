# Basic stff
source ~/.config/zsh/.zprofile #.zshenv stuff
bindkey -e
bindkey \^u backward-kill-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word

# some useful options (man zshoptions)
#setopt autocd extendedglob nomatch menucomplete
#setopt interactive_comments
#stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%f'
zstyle ':vcs_info:*' enable git

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_completion "M0hammedImran/docker-completions"

# set up autocomplete in zsh into the current shell
#source <(kubectl completion zsh)
eval "$(zoxide init --cmd cd zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"

# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/imran/.zsh/completions:"* ]]; then export FPATH="/Users/imran/.zsh/completions:$FPATH"; fi

. "/Users/imran/.deno/env"
. "$HOME/.cargo/env"
. "/Users/imran/.deno/env"

# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit
