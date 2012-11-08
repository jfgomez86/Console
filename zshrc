export PATH=/usr/local/bin:$PATH

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="gallois"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails3 bundler)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

__rvm_project_rvmrc
