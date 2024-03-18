#!/usr/bin/env bash

set -euo pipefail

# Download nerd font
temp_directory=/tmp/nerd-fonts-setup
mkdir -p $temp_directory

# Install unzip for extraction
sudo apt install unzip

# Function for download and install of nerd font:
function download() {
    cd $temp_directory
    wget $1
    unzip $2
    font_directory=$3
    sudo mkdir -p $font_directory
    cd $font_directory
    sudo cp $temp_directory/*.ttf .
}

# Install Jetbrains Mono
download https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip JetBrainsMono.zip /usr/local/share/fonts/jetbrains-mono-nerd

# Update cache
sudo fc-cache -fv