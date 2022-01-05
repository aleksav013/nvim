#!/bin/bash

NVIM_DIR=~/.config/nvim

rm -r $NVIM_DIR
mkdir -p $NVIM_DIR
stow --no-folding --ignore="LICENCE|README.md|sync.sh" -t $NVIM_DIR .
rm -rf ~/.local/share/nvim
