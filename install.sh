#!/bin/bash

#
# WSL Ubuntu install script
# -------------------------
#

# Default SSH key
if [[ ! -f ~/.ssh/id_ed25519 ]]
then
    ssh-keygen -t ed25519
fi

# Applications
sudo apt update
sudo apt upgrade
sudo apt install nodejs npm

# Dotfiles
ln -sv ~/dotfiles/git/.gitconfig ~