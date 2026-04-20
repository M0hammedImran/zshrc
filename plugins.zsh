# Plugin Management Functions

PLUGIN_DIR="$ZDOTDIR/plugins"

# Clone and source a plugin from GitHub
function zsh_add_plugin() {
    local repo="$1"
    local plugin_name="${repo##*/}"
    local plugin_dir="$PLUGIN_DIR/$plugin_name"

    # Clone if not exists
    if [[ ! -d "$plugin_dir" ]]; then
        echo "Installing plugin: $plugin_name..."
        git clone --depth 1 "https://github.com/$repo.git" "$plugin_dir"
    fi

    # Source the plugin
    if [[ -f "$plugin_dir/$plugin_name.plugin.zsh" ]]; then
        source "$plugin_dir/$plugin_name.plugin.zsh"
    elif [[ -f "$plugin_dir/$plugin_name.zsh" ]]; then
        source "$plugin_dir/$plugin_name.zsh"
    fi
}

# Add completion from GitHub repo
function zsh_add_completion() {
    local repo="$1"
    local plugin_name="${repo##*/}"
    local plugin_dir="$PLUGIN_DIR/$plugin_name"

    # Clone if not exists
    if [[ ! -d "$plugin_dir" ]]; then
        echo "Installing completion: $plugin_name..."
        git clone --depth 1 "https://github.com/$repo.git" "$plugin_dir"
    fi

    # Add to fpath for completions
    fpath=("$plugin_dir" $fpath)

    # Source plugin file if exists
    [[ -f "$plugin_dir/$plugin_name.plugin.zsh" ]] && source "$plugin_dir/$plugin_name.plugin.zsh"
}

# Update all plugins
function zsh_update_plugins() {
    echo "Updating plugins..."
    for plugin_dir in "$PLUGIN_DIR"/*/; do
        if [[ -d "$plugin_dir/.git" ]]; then
            echo "Updating ${plugin_dir##*/}..."
            git -C "$plugin_dir" pull --quiet
        fi
    done
    echo "Done!"
}

# Remove a plugin
function zsh_remove_plugin() {
    local plugin_name="$1"
    local plugin_dir="$PLUGIN_DIR/$plugin_name"

    if [[ -d "$plugin_dir" ]]; then
        rm -rf "$plugin_dir"
        echo "Removed plugin: $plugin_name"
    else
        echo "Plugin not found: $plugin_name"
    fi
}

# List installed plugins
function zsh_list_plugins() {
    echo "Installed plugins:"
    for plugin_dir in "$PLUGIN_DIR"/*/; do
        [[ -d "$plugin_dir" ]] && echo "  - ${plugin_dir%/##*/}"
    done
}

# ─────────────────────────────────────────────────────────────
# Plugins
# ─────────────────────────────────────────────────────────────

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_completion "zsh-users/zsh-completions"
