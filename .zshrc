source $ZDOTDIR/zshrc

alias claude="/Users/imran/.claude/local/claude"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/imran/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/imran/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/imran/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/imran/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# pnpm
export PNPM_HOME="/Users/imran/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/imran/.bun/_bun" ] && source "/Users/imran/.bun/_bun"
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
