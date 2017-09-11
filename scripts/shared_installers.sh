#!/usr/bin/env sh

echo "-----------------------------"
echo " Installing RVM"
echo "-----------------------------"
echo ""

\curl -sSL https://get.rvm.io | bash -s stable

echo ""
echo "-----------------------------"
echo " Installing NVM"
echo "-----------------------------"
echo ""

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

echo ""
echo "You may need to open a new terminal for these programs to be available."
echo ""
