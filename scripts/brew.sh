#!/usr/bin/env bash

set -e

source ./scripts/helper

ruby_bin="/usr/bin/ruby"
brew_install_url="https://raw.githubusercontent.com/Homebrew/install/master/install"

function check_brew_installation () {
    if [ `command -v brew` ]; then
        c.log "Installing Homebrew..."

        $ruby_bin -e "$(curl -fsSL $brew_install_url)"

        check_brew_installation
    else
        c.success "Homebrew is successfully installed!"
    fi
}

function brew_update () {
    c.ingo "Updating Homebrew..."
    brew update
}


function brew_install_bundle () {
    if [ -f "Brewfile" ]; then
        c.info "Installing Brew Packages via Brewfile..."
       brew bundle # Install Brew Packages via Brewfile
       c.success "Brew Packages is installed!"
    else
        c.error "Brewfile not found!"
    fi
}

function main () {
    check_brew_installation
    brew_update
    brew_install_bundle
}

# Entrypoint
main;
