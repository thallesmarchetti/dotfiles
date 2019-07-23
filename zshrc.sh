#!/usr/bin/env bash

# ask for password before all the scripts

sudo echo "ask for password before all the scripts"

# set .zshrc
wget -O $HOME/.zshrc https://gist.githubusercontent.com/thallesmarchetti/bb4ed1f801a77fa068e6b738ca1b5b21/raw/e1c48f79d07a84fe823432613eec0af84cbeb74e/.zshrc

# install oh-my-zsh plugins

## syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
## autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

