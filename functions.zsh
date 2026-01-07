# Function to source files if they exist
function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

# Function to add a plugin (auto-clones if missing)
function zsh_add_plugin() {
    local PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    local PLUGIN_DIR="$ZDOTDIR/plugins/$PLUGIN_NAME"

    if [ -d "$PLUGIN_DIR" ]; then
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$PLUGIN_DIR"
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    fi
}

# Function to add completions from a plugin
function zsh_add_completion() {
    local PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    local PLUGIN_DIR="$ZDOTDIR/plugins/$PLUGIN_NAME"

    if [ -d "$PLUGIN_DIR" ]; then
        local completion_file_path=$(ls $PLUGIN_DIR/_* 2>/dev/null)
        if [ -n "$completion_file_path" ]; then
            fpath+="$(dirname "${completion_file_path}")"
        fi
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
    else
        git clone "https://github.com/$1.git" "$PLUGIN_DIR"
        local completion_file_path=$(ls $PLUGIN_DIR/_* 2>/dev/null)
        if [ -n "$completion_file_path" ]; then
            fpath+="$(dirname "${completion_file_path}")"
        fi
        [ -f "$ZDOTDIR/.zcompdump" ] && rm "$ZDOTDIR/.zcompdump"
    fi

    # Reinitialize completions if requested
    if [ "$2" = true ]; then
        autoload -Uz compinit && compinit
    fi
}

# Create directory and cd into it
function mki() {
    mkdir -p "$1" && cd "$1"
}

# Extract various archive formats
function extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.tar.xz)    tar xJf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
