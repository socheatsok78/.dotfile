#!/usr/bin/env bash

set -e

source ./scripts/helper

function install_xcode_commandline_tool () {
    if [ -f "$DOTFILE_CONFIG_HOME/XCODE_INSTALLED_COMMANDLINE_TOOLS" ]; then
        c.warn "[SKIP]: xCode Command-line tools was already installed"
    else
        xcode-select --install || true
        sudo xcodebuild -license accept || true

        touch "$DOTFILE_CONFIG_HOME/XCODE_INSTALLED_COMMANDLINE_TOOLS"
    fi
}

function main () {
    if [[ "$(uname -s)" == "Darwin" ]]; then
        # Only run on Mac OS
        install_xcode_commandline_tool
    else
        c.warn "[SKIP]: xCode Command-line tools, not on a mac!"
    fi
}

# Entrypoint
main
