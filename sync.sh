#!/bin/bash

NVIM_DIR=

rm -rf ~/.config/nvim
mkdir -p ~/.config/nvim 
stow --no-folding --ignore="LICENCE|README.md|sync.sh" -t ~/.config/nvim .

rm -rf ~/.local/share/nvim
