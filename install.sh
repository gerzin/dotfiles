#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

list_configs() {
    ls -1 "$SCRIPT_DIR/stow" | fzf --prompt="Select config to install: "
}

install_package() {
    local pkg="$1"
    stow -v -d "$SCRIPT_DIR/stow" -t "$HOME" "$pkg"
}

main() {
    local pkg
    pkg=$(list_configs)
    if [[ -n "$pkg" ]]; then
        install_package "$pkg"
    else
        echo "No package selected. Exiting."
    fi
}

main "$@"
