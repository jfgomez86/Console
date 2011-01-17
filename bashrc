# ~/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
if [[ -n "$PS1" ]] ; then

  PATH=$PATH:/usr/local/bin:/opt/local/bin:/usr/local/mysql/bin/:/usr/local/pgsql/bin/:~/local/bin/

  export PGDATA=~/Library/PostgreSQL/Data/
  export HISTCONTROL=ignoreboth
  export TERM=xterm-256color
  export EDITOR=vim
  export VISUAL=vim
  export PATH

  if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi

  if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
  fi

  if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
  fi


  shopt -s checkwinsize
  shopt -s cdspell
  shopt -s histappend

  # make less more friendly for non-text input files, see lesspipe(1)
  [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

  export PS1="\[\e[00;32m\]┌─[\[\e[0m\]\u\[\e[00;32m\]][\[\e[0m\]\[\e[0;34m\]\w\[\e[0m\]\[\e[00;32m\]] \[\e]1;\]\W\[\a\]\n\[\e[00;32m\]└─╼\[\e[0m\] "
  xkcd(){ local f=$(curl -s http://xkcd.com/);open $(echo "$f"|grep -Po '(?<=")http://imgs.xkcd.com/comics/[^"]+(png|jpg)');echo "$f"|awk '/<img src="http:\/\/imgs\.xkcd\.com\/comics\/.*?" title=.*/{gsub(/^.*title=.|".*?$/,"");print}';}
  xkcdrandom(){ local f=$(wget -q http://dynamic.xkcd.com/comic/random/ -O -);open $(echo "$f"|grep -Po '(?<=")http://imgs.xkcd.com/comics/[^"]+(png|jpg)');echo "$f"|awk '/<img src="http:\/\/imgs\.xkcd\.com\/comics\/.*?" title=.*/{gsub(/^.*title=.|".*?$/,"");print}';}
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
