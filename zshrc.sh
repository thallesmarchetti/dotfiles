#!/usr/bin/env bash

# ask for password before all the scripts

sudo echo "ask for password before all the scripts"

# set .
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# set .zshrc
wget -O $HOME/.zshrc https://gist.githubusercontent.com/thallesmarchetti/bb4ed1f801a77fa068e6b738ca1b5b21/raw/5090f14608f8245b8913e3134fd108a5c2c3147b/.zshrc

# set .zshrc_aliases
wget -O $ZSH/.zshrc_aliases https://gist.githubusercontent.com/thallesmarchetti/8c57ad14624985612853638ec774099b/raw/ee34431e8476091e0e443bf96614103ddbe9122c/.zshrc_aliases

# install oh-my-zsh plugins

## syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
## autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions