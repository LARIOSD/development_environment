#!/bin/bash

sudo apt-get update

echo "Installing curl..."
sudo apt install curl 
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
echo "Installing nvm..."
source ~/.profile 
echo "Installing node..."
nvm install node 
nvm install 14 lts
nvm install 17 lts
nvm ls 
echo "NVM Ready (>_<)..."

