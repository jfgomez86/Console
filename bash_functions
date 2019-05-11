SITES_ENABLED=/etc/nginx/sites-enabled
SITES_AVAILABLE=/etc/nginx/sites-available
PROJECTS_DIR=/Users/jose/Projects

function sites {
  if [ -z "$1" ]; then
    echo
    echo "Options: sites [enable|disable|edit] [sitename]"
    echo
    echo "    Enabled sites:"
    echo
    for file in $(ls $SITES_ENABLED) ; do
      echo "[+] $file"
    done
    echo
    echo "    Available sites:"
    echo
    for file in $(ls $SITES_AVAILABLE) ; do
      echo "[-] $file"
    done
  else
    case "$1" in
      "enable")
        if [ -f $SITES_AVAILABLE/$2 ] ; then
          echo "Symlinking $SITES_AVAILABLE/$2 to $SITES_ENABLED/$2"
          sudo ln -s $SITES_AVAILABLE/$2 $SITES_ENABLED/$2
        fi
      ;;
      "disable")
        if [ -f $SITES_ENABLED/$2 ] ; then
          echo "Removing symlink $SITES_ENABLED/$2"
          sudo rm $SITES_ENABLED/$2
        fi
      ;;
      "edit")
        if [ -f $SITES_AVAILABLE/$2 ] ; then
          sudo vim $SITES_AVAILABLE/$2
        fi
      ;;
    esac
  fi
}

p() {
  PROJECT_NAME="$1";
  cd "$PROJECTS_DIR/$PROJECT_NAME";
}

_p_complete() {
  local cur opts
  cur="${COMP_WORDS[COMP_CWORD]}"
  opts="$(ls $PROJECTS_DIR)"

  COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
  return 0
}
complete -F _p_complete p

downloadicons() {
  URL="$1";
  for image in `curl $URL | grep icon-image | sed "s/.*src=\'\(.*\)\'.*/\1/g"` ; do
    curl -O $image ;
  done
}

# vim: set ft=sh:
