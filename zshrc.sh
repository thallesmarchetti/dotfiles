#!/usr/bin/env bash

# ask for password before all the scripts

sudo echo "ask for password before all the scripts"

# set .
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# set .zshrc
wget -O $HOME/.zshrc https://gist.githubusercontent.com/thallesmarchetti/bb4ed1f801a77fa068e6b738ca1b5b21/raw/2a16b6d59bf87eb1f2f19d5825f8c24add8dcee0/.zshrc

# install oh-my-zsh plugins

## syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
## autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

