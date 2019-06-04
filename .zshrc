export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git alias-tips zsh-completions almostontop zsh-autosuggestions pip )
plugins+=(history history-substring-search httpie sudo vagrant postgres tig)
plugins+=(osx lein node npm z mosh k zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# aliases

# System
alias down="cd ~/Downloads"
alias dev="cd ~/Development"
alias sqlinit="mysql.server start"
alias sqlstop="mysql.server stop"
alias ng="npm list -g --depth=0 2>/dev/null"
alias nl="npm list --depth=0 2>/dev/null"
alias l='ls -lah'

## GIT
GIT_AUTHOR_NAME="Thalles Marchetti"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="linkmarchetti@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

## NPM
npm set init.author.email "linkmarchetti@gmail.com"
npm set init.author.name "Thalles Marchetti"
npm set init.license "MIT"

# Softwares
alias chrome="open -a 'Google Chrome'"
alias whats="open -a 'WhatsApp'"
alias franz="open -a 'franz'"
alias xc="open -a Xcode"
alias as="open -a Android\ Studio"
alias spotify="open -a Spotify"

# MySQL 5.7
alias sql="mysql -u root -p"
alias mysql="/usr/local/mysql/bin/mysql"
alias mysqladmin="/usr/local/mysql/bin/mysqladmin"

# MySQL homeBrew
alias sqlinit="mysql.server start"
alias sqlstop="mysql.server stop"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"