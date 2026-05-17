#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/fastfetch"
TARGET_DIR="$HOME/.config/fastfetch"
TARGET_CONFIG="$TARGET_DIR/config.jsonc"

mkdir -p "$TARGET_DIR"

if [[ -f "$TARGET_CONFIG" ]]; then
    n=1
    while [[ -f "$TARGET_DIR/old_config${n}.jsonc" ]]; do
        (( n++ ))
    done
    mv "$TARGET_CONFIG" "$TARGET_DIR/old_config${n}.jsonc"
fi

cp -r "$SOURCE_DIR/." "$TARGET_DIR/"

echo "Configuration applied, restart your terminal and run fastfetch"
