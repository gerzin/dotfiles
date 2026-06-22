#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

list_configs() {
    ls -1 "$SCRIPT_DIR/stow" | fzf --prompt="Select config to install: "
}

install_config() {
    local pkg="$1"
    stow -v -d "$SCRIPT_DIR/stow" -t "$HOME" "$pkg"
}

main() {
    local pkg
    pkg=$(list_configs)
    if [[ -n "$pkg" ]]; then
        install_config "$pkg"
    else
        echo "No config selected. Exiting."
    fi
}

main "$@"
