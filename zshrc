# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="clean"

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
plugins=(git rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

# Zsh-compatible aliases :D
source ~/.bash_aliases

# My Projects shortcut function:
PROJECTS_DIR="/Users/jfgomez86/Projects"
p() {
  PROJECT_NAME="$1";
  cd "$PROJECTS_DIR/$PROJECT_NAME";
}

_projects_list() {
  reply=($(ls $PROJECTS_DIR))
}

_heroku_apps() {
  reply=($(heroku list | awk {'print $1'}))
}

compctl -K _projects_list p
compctl -x 's[--app],c[-1,--app]' -K _heroku_apps -- heroku

export EDITOR='mvim -f'

launch () {
  project="$1"
  /usr/bin/osascript ~/.console/apple_scripts/launch_project.scpt $project
}

compctl -K _projects_list launch
PATH=/usr/local/heroku/bin:/usr/local/bin:$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting

source /Users/jfgomez86/.rvm/scripts/rvm
