#!/usr/bin/env bash

echo -en "Preparing world domination...\n"

# Include Adam Eivy's library helpers.
source ./lib.sh

# Prevent sleep while install is running
caffeinate &

#####
# Introduction
#####

awesome_header

fullname=$(osascript -e "long user name of (system info)")

bot "Hi $fullname. I'm going to make your OSX system better. We're going to:"
action "install Xcode's command line tools"
action "install Homebrew and brew cask"
action "install apps"
action "if you feel like it, we will also install more things"
bot "One more thing: I'll need your password from time to time."

read -r -p "Let's go? [y|N] " response
if [[ $response =~ ^(y|yes|Y) ]]; then
    ok
else
    exit 1
fi

#####
# install Xcode command line tools
#####

running "checking Xcode CLI install"
xcode_select="xcode-select --print-path"
xcode_install=$($xcode_select 2>&1 > /dev/null)
if [[ $? != 0 ]]; then
    bot "You are missing the Xcode CLI tools. I'll launch the install for you, but then you'll have to restart the process again."
    running "After that you'll need to paste the command and press Enter again."

    read -r -p "Let's go? [y|N] " response
    if [[ $response =~ ^(y|yes|Y) ]]; then
        xcode-select --install
    fi

    exit 1
fi
ok

bot "OK, let's roll..."

# ###########################################################
# install homebrew (CLI Packages)
# ###########################################################
running "checking homebrew..."
brew_bin=$(which brew 2>&1 > /dev/null)
if [[ $? != 0 ]]; then
  action "installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [[ $? != 0 ]]; then
    error "unable to install homebrew, script $0 abort!"
    exit 2
  fi
  brew analytics off
else
  ok
  bot "Homebrew"
  read -r -p "run brew update && upgrade? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]]; then
    action "updating homebrew..."
    brew update
    ok "homebrew updated"
    action "upgrading brew packages..."
    brew upgrade
    ok "brews upgraded"
  else
    ok "skipped brew package upgrades."
  fi
fi

ok

./apps.sh

bot "Woot! All done. If you want to go further, here are some options:"

read -r -p "install extra development command-line tools? (node, curl, etc) [y|N] " cli_response
if [[ $cli_response =~ ^(y|yes|Y) ]]; then
    ok "will install command-line tools."
    ./macos.sh
    ./cli.sh
else
    ok "will skip command-line tools."
fi

read -r -p "create our development folder structure (~/Development/)? [y|N] " dev_folder_response
if [[ $dev_folder_response =~ ^(y|yes|Y) ]]; then
    ok "will create the folder structure."
    mkdir -p ~/Development/
    ok "Created ~/Development/"
else
    ok "will skip folder structure."
fi

bot "Here are the most useful resources. Have fun!"

