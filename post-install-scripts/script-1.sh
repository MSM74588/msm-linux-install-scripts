#!/bin/bash

# bash <(wget -nv -O - https://raw.githubusercontent.com/MSM74588/msm-linux-install-scripts/main/post-install-scripts/script-1.sh)

sudo add-apt-repository multiverse
sudo add-apt-repository restricted
sudo add-apt-repository universe
sudo apt update
sudo apt-get update

sudo apt install -y flatpak plasma-discover-backend-flatpak 
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 

#disable kde5 wallet
pkill kwallet
kwriteconfig5 --file kwalletrc --group 'Wallet' --key 'Enabled' 'false'
kwriteconfig5 --file kwalletrc --group 'Wallet' --key 'First Use' 'false'

#Configure fish
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish

chsh -s /usr/bin/fish
mkdir -p ~/.config/fish
set -g -x fish_greeting ''

echo "[COMPLETED] Script-1 completed!"