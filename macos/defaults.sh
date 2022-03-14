#!/bin/bash

# Dark mode and pink highlight
osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true"
defaults write NSGlobalDomain AppleHighlightColor -string "1.000000 0.749020 0.823529"

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Set sidebar icon size to small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false