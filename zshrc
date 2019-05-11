ZSH=$HOME/.oh-my-zsh
# Path to your oh-my-zsh configuration.

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="clean"
# ZSH_THEME="powerlevel9k/powerlevel9k"

# POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
# POWERLEVEL9K_STATUS_VERBOSE=false
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
# POWERLEVEL9K_SHOW_CHANGESET=true
# POWERLEVEL9K_CHANGESET_HASH_LENGTH=6

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Zsh-compatible aliases :D
source ~/.bash_aliases

# My Projects shortcut function:
PROJECTS_DIR="/Users/jose/Projects"
p() {
  PROJECT_NAME="$1";
  cd "$PROJECTS_DIR/$PROJECT_NAME";
}

_projects_list() {
  reply=($(ls -tCd $PROJECTS_DIR/*/** | sed -e "s-$PROJECTS_DIR/--"))
}

_heroku_apps() {
  reply=($(heroku list | awk {'print $1'}))
}

# Setup Completion Functions
compctl -K _projects_list p
compctl -x 's[--app],c[-1,--app]' -K _heroku_apps -- heroku

# Set mvim as the default editor
export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/heroku/bin

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

