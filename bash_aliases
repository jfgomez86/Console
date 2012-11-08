# Edit/Apply Configurations
#################################
alias vvimrc="vim ~/.vimrc"
alias vbashrc="vim ~/.bashrc"
alias valias="vim ~/.bash_aliases"
alias vfunctions="vim ~/.bash_functions"
alias vgitignore='vim ~/.gitignore'
alias sb="source ~/.bashrc"
alias v="vim --remote"

# Extended Commands Aliases
#################################
alias grep='grep --color=auto'
alias tree='tree -L 2'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias startpg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stoppg='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias clearusb='find . -iname ".*" -type f -exec rm {} \;'

# Scripts and application aliases
#################################
alias gv='mvim'
alias sc='ruby script/console'
alias ss='ruby script/server'
alias rgen='ruby script/generate'
alias gs='git status'
alias gc='git commit'
alias grm="git status | grep deleted | awk {'print $3'}"
alias ..='pushd ..'
alias ...='pushd ../..'
alias ....='pushd ../../..'
alias rdbs='rake db:drop && rake db:create && rake db:migrate'
alias t='term'
alias postgres.start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgres.stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# Bash Directory Bookmarks (http://www.huyng.com/archives/492)
#################################
alias m1='alias g1="cd `pwd`"'
alias m2='alias g2="cd `pwd`"'
alias m3='alias g3="cd `pwd`"'
alias m4='alias g4="cd `pwd`"'
alias m5='alias g5="cd `pwd`"'
alias m6='alias g6="cd `pwd`"'
alias m7='alias g7="cd `pwd`"'
alias m8='alias g8="cd `pwd`"'
alias m9='alias g9="cd `pwd`"'
alias mdump='alias|grep -e "alias g[0-9]"|grep -v "alias m" > ~/.bookmarks'
alias lma='alias | grep -e "alias g[0-9]"|grep -v "alias m"|sed "s/alias //"'
touch ~/.bookmarks
source ~/.bookmarks

[[ -x /Applications/MacVim.app/Contents/MacOS/Vim ]] && alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

# vim: set ft:sh:
