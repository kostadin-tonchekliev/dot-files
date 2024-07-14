#!/bin/bash

# Specify the location for the tmux config
default_location=~/.config/tmux

echo "[!] This script is to be run in the same directory of the repository"

echo "[+] Installing tmux for $OSTYPE"
if [[ "$OSTYPE" == "darwin23" ]]; then
	brew install tmux yq
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
	sudo apt install tmux yq
fi

echo "[+] Creating the following directories:"
echo -e "\t $default_location"
echo -e "\t $default_location/plugins/tpm"
echo -e "\t ~/.tmux/plugins/tpm"
mkdir -p $default_location/plugins/tpm
mkdir -p ~/.tmux/plugins/tpm

echo "[+] Cloning the tmux plugin manager to ~/.tmux/plugins/tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "[+] Symlinking the current config to $default_location/tmux/tmux.conf"
ln -s $(pwd)/config/tmux.conf $default_location/tmux.conf

echo "[!] Setup done, to finalize open a new tmux window and run Control + B + I"
