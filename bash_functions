SITES_ENABLED=/etc/nginx/sites-enabled
SITES_AVAILABLE=/etc/nginx/sites-available

function sites {
  if [ -z "$1" ]; then
    echo
    echo "Options: sites [enable|disable] [sitename]"
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
        if [ -f $SITES_ENABLED/$2 ] ; then
          sudo vim $SITES_ENABLED/$2
        fi
      ;;
    esac
  fi
}

# vim: set ft=sh:
