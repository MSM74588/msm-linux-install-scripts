# ┌──────────────────────────────────────────────────────────────────────────────┐
# │ Linux Pre-install script. By MandraSaptak Mandal                             │
# └──────────────────────────────────────────────────────────────────────────────┘

# * https://github.com/luong-komorebi/Awesome-Linux-Software
# * https://invent.kde.org/plasma/plasma-desktop


sudo add-apt-repository multiverse
sudo add-apt-repository restricted
sudo apt update

sudo apt install curl git python3 python3-pip software-properties-common ttf-mscorefonts-installer ca-certificates -y





# ! uninstall Unity Installer
# TODO: Install Calamares Installer
# Calamares Config are present in /etc/calamares
# Change Settings.conf >> branding: <Your Branding>. 
# The branding files must be present in /etc/calamares/branding

#the component name and the branding dir name must be same  

sudo cp /etc/apt/sources.list /etc/apt/sources.list~
sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list #allows build sources
sudo apt-get update


apt-get build-dep calamares -y #build dependencies for calamares (auto install)

## Change CmakeList.txt > Icons. etc


# TODO: Themeing Calamares
# * sudo apt-get build-dep calamares

# TODO: Configure Preseed

# TODO: Setup GRUB
# TODO: Setup GRUB2

# TODO: Setup NoHang
add-apt-repository ppa:oibaf/test
apt update
apt install nohang
systemctl enable --now nohang-desktop.service


# TODO: Setup KCMs

# TODO: Setup Fish and Oh-my-fish
# TODO: Customise Neofetch and data on /proc
# * https://unix.stackexchange.com/questions/276119/custom-os-version-ing

# ! Sets up Plasma build Dependencies
# sudo apt build-dep plasma-desktop plasma-workspace kwin
sudo apt install calamares



# TODO: Install Themes

#/usr/share/plasma/
# TODO: Setup Plasma Themes, Plasmarc, Plasma Applets (Desktop) to /skel
# TODO: Install Wallpaper
# TODO: Setup SDDM
# TODO: K APPS config 
# TODO: NVIDIA PRime
# TODO: Kwin Scripts and config for transparency etc...

    # ! curl <command> | bash {As Sudo or sudo -i}

# TODO: setup plymouth themes, Python, Pavu Control

# TODO: Setup Konsave, Ksuperkey(Autostart), 
# TODO: Auto Update (github)

# TODO: Install VS Code_(Or codeOSS)
# TODO: Remove Firefox and manually install vivaldi
# TODO: Good Calculator apps and my recommended apps

# TODO: Setup Fonts and Keyboard Shortcuts

wget -q -O - https://gist.githubusercontent.com/Blastoise/72e10b8af5ca359772ee64b6dba33c91/raw/2d7ab3caa27faa61beca9fbf7d3aca6ce9a25916/clearType.sh | bash #Microsoft ClearType Fonts
wget -q -O - https://gist.githubusercontent.com/Blastoise/b74e06f739610c4a867cf94b27637a56/raw/96926e732a38d3da860624114990121d71c08ea1/tahoma.sh | bash #Tahoma and Segoe-UI Fonts
wget -q -O - https://gist.githubusercontent.com/Blastoise/64ba4acc55047a53b680c1b3072dd985/raw/6bdf69384da4783cc6dafcb51d281cb3ddcb7ca0/segoeUI.sh | bash
wget -q -O - https://gist.githubusercontent.com/Blastoise/d959d3196fb3937b36969013d96740e0/raw/429d8882b7c34e5dbd7b9cbc9d0079de5bd9e3aa/otherFonts.sh | bash #Other essential fonts


# TODO: Setup Propriotery Drivers and Graphics Driver Wizard
# TODO: Flatpak or snap
# TODO: Kvantum
# TODO: Grub Customiser


##############################################################################################
# TODO: Gfonts


# Written by: Keefer Rourke <https://krourke.org>
# Based on AUR package <https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=ttf-google-fonts-git>

# dependancies: fonts-cantarell, ttf-ubuntu-font-family, git

# ! MIGHT need to change source dir as /tmp folder may not be available in an iso

sudo apt-get install fonts-cantarell ttf-ubuntu-font-family git
srcdir="/tmp/google-fonts"
pkgdir="/usr/share/fonts/truetype/google-fonts"
giturl="git://github.com/google/fonts.git"

mkdir $srcdir
cd $srcdir
echo "Cloning Git repository..."
git clone $giturl

echo "Installing fonts..."
sudo mkdir -p $pkgdir
sudo find $srcdir -type f -name "*.ttf" -exec install -Dm6  44 {} $pkgdir \;

echo "Cleaning up..."
sudo find $pkgdir -type f -name "Cantarell-*.ttf" -delete \;
sudo find $pkgdir -type f -name "Ubuntu-*.ttf" -delete \;

# provides roboto
sudo apt-get --purge remove fonts-roboto

echo "Updating font-cache..."
sudo fc-cache -f > /dev/null

echo "Done!"

#################################################################################################


# Take inspiration from CutefishOS, Garuda, Manjaro, WindowsFX and ZorinOS and FerenOS

# GNOME DIsk utility
# Warpinator
# Haruna Player
# Simple Screeen Recorder 
# ? Stacer / Python Based System Monitor (Better is stacer)
# A good Drawing App

# ? Take inspiration from Other Linux OS and Windows 11 and 10 and XP

# ? LibreOffice, Openoffice, Softmaker, etc
# ? Browser => Edge, Min, Vivaldi, Firefox
# ? Propriotary Media Codecs


# ? Anbox Setup, KVM Setups

# ! Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list
rm microsoft.gpg
apt-get update
apt-get install -y code

# File Light
# Steam
# Alacritty
# Android file transfer
# Ark
# Gnome calender
# gnome disk util
# CPU X
# Dconf editor
# Devhelp
#App image launcher
# App image store (Google App)


# Fontforge

# gITHUB DESKTOP

# Grub Customizer
# GStreamer
# Handbrake
# Info Center

# Meteo qt
# Parental controls

# Printers
# HP cups
# PAVU controll

# Synaptic Package manager
# Timeshift

# Winetricks

# ? Add TIme difference Problem in the TroubleShooter

# customise Bashrc for sudo by edition /etc/bash.bashrc
# PReload custom themes for libreoffice

#! Discover - Flatpak backend

#! Helper Idea ++= Install fingerprint support, Printer support

apt-get autoremove -y