#!/usr/bin/env bash

# include library helpers for colorized echo and require_brew, etc
source ./lib.sh

###############################################################################
# Install CLI tools using Homebrew                                             #
###############################################################################

bot "installing command-line tools"


read -r -p "install the UNIX tools? (shells, wget, etc) [y|N] " unixresponse
if [[ $unixresponse =~ ^(y|yes|Y) ]];then
    ok "will install UNIX tools."
else
    ok "will skip UNIX tools.";
fi

read -r -p "install runtimes? (node, python, etc) [y|N] " runtimesresponse
if [[ $runtimesresponse =~ ^(y|yes|Y) ]];then
    ok "will install runtimes."
else
    ok "will skip runtimes.";
fi

read -r -p "install npm and gem? [y|N] " packagesresponse
if [[ $packagesresponse =~ ^(y|yes|Y) ]];then
    ok "will install packages."
else
    ok "will skip packages.";
fi

if [[ $unixresponse =~ ^(y|yes|Y) ]];then
    action "install brew packages..."

    require_brew bash
    require_brew git
    require_brew wget
    require_brew curl
    require_brew vim

    ok "packages installed..."
else
    ok "skipped command-line tools.";
fi

if [[ $runtimesresponse =~ ^(y|yes|Y) ]];then
    action "install brew packages..."

    require_brew node
    require_brew yarn
    require_brew watchman
    require_brew mysql

    ok "packages installed..."
else
    ok "skipped runtimes.";
fi

if [[ $packagesresponse =~ ^(y|yes|Y) ]];then
    action "install npm / yarn..."

    function require_gem() {
        running "gem $1"
        if [[ $(gem list --local | grep "$1" | head -1 | cut -d' ' -f1) != "$1" ]];
            then
                action "gem install $1"
                gem install "$1"
        fi
        ok
    }

    npmlist=$(npm list -g)
    function require_npm() {
        running "npm $1"
        echo "$npmlist" | grep "$1@" > /dev/null
        if [[ $? != 0 ]]; then
            action "npm install -g $1"
            npm install -g "$1"
        fi
        ok
    }

    require_npm bower
    require_npm browser-sync
    require_npm browserify
    require_npm webpack
    require_npm gulp-cli
    require_npm gulp
    require_npm eslint

    ok "packages installed..."
else
    ok "skipped packages.";
fi

bot "Woot! All done."