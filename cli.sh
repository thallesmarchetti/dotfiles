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

    require_brew zsh
    require_brew zsh-completions
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
    require_brew mysql

    ok "packages installed..."
else
    ok "skipped runtimes.";
fi

if [[ $packagesresponse =~ ^(y|yes|Y) ]];then
    action "install npm / yarn / pip packages..."

    function require_gem() {
        running "gem $1"
        if [[ $(gem list --local | grep "$1" | head -1 | cut -d' ' -f1) != "$1" ]];
            then
                action "gem install $1"
                gem install "$1"
        fi
        ok
    }

    yarnlist=$(yarn list -g)
    function require_yarn() {
        running "yarn $1"
        echo "$yarnlist" | grep "$1@" > /dev/null
        if [[ $? != 0 ]]; then
            action "yarn global add -g $1"
            yarn global add -g "$1"
        fi
        ok
    }

    require_yarn bower
    require_yarn browser-sync
    require_yarn browserify
    require_yarn webpack
    require_yarn gulp
    require_yarn eslint

    ok "packages installed..."
else
    ok "skipped packages.";
fi

bot "Woot! All done."