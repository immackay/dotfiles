#!/bin/sh
# Sets reasonable macOS defaults.
#
# Run ./defaults.sh and you'll be good to go.

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle clmv

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 1

# Set up developer tools for Safari
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Interface
defaults write NSGlobalDomain AppleAccentColor -int 5
defaults write NSGlobalDomain AppleAquaColorVariant -int 1
defaults write NSGlobalDomain AppleHighlightColor -string "0.968627 0.831373 1.000000 Purple"
defaults write NSGlobalDomain AppleInterface -string "Dark"

defaults write com.apple.finder AppleShowAllFiles -bool true
