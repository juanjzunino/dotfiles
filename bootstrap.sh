#!/bin/bash

##############################################################################
# General                                                                    #
##############################################################################

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Look for developer tools (needed for Homebrew)
xcode-select -p
if [ $? -eq 0 ]; then
    echo "Found XCode Tools"
else
    echo "Installing XCode Tools"

    xcode-select --install
fi

# Flags
set -e # Global exit on error flag
set -x # Higher verbosity for easier debug
set -o pipefail # Exit on pipe error

# Change shell script files to run
chmod +x *.sh

# Allow third party software
sudo spctl --master-disable

# Since XCode got installed, need to agree to license
sudo xcodebuild -license

##############################################################################
# Package Manager                                                            #
##############################################################################

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update

# Install Brewfile
brew tap homebrew/bundle
brew bundle --file=$HOME/dotfiles/macOS/Brewfile

##############################################################################
# Create Symlinks                                                            #
##############################################################################

# Symlinks files
PROGRAMS=(terminal shell editor bins macOS)

for program in ${PROGRAMS[@]}; do
    stow -Sv --target=$HOME $program
done

##############################################################################
# Shells                                                                     #
##############################################################################

# Add shells
sudo sh -c 'echo /usr/local/bin/bash >> /etc/shells'
sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
sudo sh -c 'echo /usr/local/bin/fish >> /etc/shells'


##############################################################################
# macOS Settings                                                             #
##############################################################################

# Source macOS settings
source $HOME/dotfiles/macOS/.macos
