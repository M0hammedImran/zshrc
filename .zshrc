source $ZDOTDIR/zshrc

# pnpm
export PNPM_HOME="/home/imran/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(starship init zsh)"
. "$HOME/.cargo/env"

# set up autocomplete in zsh into the current shell
#source <(kubectl completion zsh)
eval "$(zoxide init --cmd cd zsh)"

# pnpm
export PNPM_HOME="/home/imran/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
