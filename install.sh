#!/bin/bash

echo ""
echo "=== Installing common tools ==="
echo ""

for install_script in $HOME/.dotfiles/system/install/*.sh; do
  source $install_script
done

while [ $# -ne 0 ]
do
    arg="$1"
    case "$arg" in
        --mac)
            echo ""
            echo "=== Installing MacOSX tools ==="
            echo ""
            for install_script in $HOME/.dotfiles/system/install/*.sh.mac; do
              source $install_script
            done
            ;;
        --zim)
            echo ""
            echo "=== Installing ZIM zsh extensions ==="
            echo ""
            for install_script in $HOME/.dotfiles/system/install/*.sh.zim; do
              source $install_script
            done
            ;;
        *)
            ;;
    esac
    shift
done

echo ""
echo ""
echo "Installation complete"
echo "To use your new configuration, either:"
echo " 1. Type: source ~/.zshrc"
echo " 2. Open a new terminal window"
