#!/bin/bash

#
# macOS install script
# -------------------------
#

# Default SSH key
if [[ ! -f ~/.ssh/id_ed25519 ]]
then
    ssh-keygen -t ed25519
fi

# Applications (Homebrew)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install $(awk '{print $1'} macos/brew.txt)

# Homebrew cask apps
brew update
brew tap homebrew/cask
brew install --cask $(awk '{print $1'} macos/cask.txt)

# VS Code extensions
code --install-extension $(awk '{print $1'} windows/vscode.txt)

# Dotfiles
rm ~/.gitconfig
ln -sv ~/dotfiles/linux/.gitconfig ~

rm ~/.bashrc
ln -sv ~/dotfiles/linux/.bashrc ~
. ~/.bashrc

rm ~/.config/tvnamer/tvnamer.json
mkdir ~/.config/tvnamer
ln -sv ~/dotfiles/linux/.tvnamer.json ~/.config/tvnamer/tvnamer.json

ln -sv ~/dotfiles/linux/.ssh/config ~/.ssh
:q!:q
# Jekyll
gem install bundler jekyll
bundle update --bundler

# Vue.js
npm install -g @vue/cli vue

source macos/defaults.sh

# Confirm completion
figlet "... and we're back!" | lolcat
