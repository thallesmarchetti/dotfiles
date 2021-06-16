#!/usr/bin/env bash

# include library helpers for colorized echo and require_brew, etc
source ./lib.sh

###############################################################################
# Install apps using Homebrew                                             #
###############################################################################

bot "installing Apps"

read -r -p "install the everyday tools? (Browsers, Slack, etc) [y|N] " everydayresponse
if [[ $everydayresponse =~ ^(y|yes|Y) ]];then
    ok "will install everyday tools."
else
    ok "will skip everyday tools.";
fi

read -r -p "install the developer tools? (iTerm, vscode, etc) [y|N] " developerresponse
if [[ $developerresponse =~ ^(y|yes|Y) ]];then
    ok "will install developer tools."
else
    ok "will skip developer tools.";
fi

bot "Let's go! Make sure to check on your computer regularly in case something needs your password."

if [[ $everydayresponse =~ ^(y|yes|Y) ]];then
    action "install brew cask packages..."
    require_cask google-chrome
    require_cask google-drive
    require_cask slack
    require_cask spotify
    require_cask teamviewer
    require_cask whatsapp
    require_cask zoom
    require_cask microsoft-edge
    require_cask microsoft-teams
    require_cask microsoft-office

    ok "casks installed..."
else
    ok "skipped everyday tools.";
fi

if [[ $developerresponse =~ ^(y|yes|Y) ]];then

    action "install brew cask packages..."

    require_cask iterm2
    require_cask adobe-creative-cloud
    require_cask postman
    require_cask visual-studio-code
    require_cask android-studio

    ok "casks installed..."
else
    ok "skipped developer tools.";
fi
