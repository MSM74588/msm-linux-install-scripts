#!/bin/bash

## Preffered OS: Kubuntu
# works with any Debian based OS

# For Dual boot systems: 
#timedatectl set-local-rtc 1

sudo add-apt-repository multiverse
sudo add-apt-repository restricted
sudo add-apt-repository universe
sudo apt update

sudo apt install flatpak plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#Reboot might be required after flatpak install

###################################################### REBOOT BREAK ##########################################################################

sudo apt install curl git python3 python3-pip software-properties-common ttf-mscorefonts-installer ca-certificates \
gnome-disk-utility akira anjuta mpv fish kamoso htop neofetch grub-customizer stacer openssh-server synaptic latexila modem-manager-gui\
-y

sudo flatpak install flathub com.axosoft.GitKraken com.belmoussaoui.Decoder \
com.belmoussaoui.Obfuscate com.bitwig.BitwigStudio com.discordapp.Discord com.gigitux.youp com.github.Flacon \
com.github.alexhuntley.Plots com.github.calo001.fondo com.github.donadigo.appeditor com.github.fabiocolacio.marker \
com.github.iwalton3.jellyfin-media-player com.github.liferooter.textpieces com.github.taiko2k.tauonmb com.github.unrud.RemoteTouchpad \
com.github.xournalpp.xournalpp com.jgraph.drawio.desktop com.rafaelmardojai.Blanket com.leinardi.gwe com.rafaelmardojai.SharePreview \
com.spotify.Client com.usebottles.bottles de.haeckerfelix.AudioSharing fr.romainvigier.MetadataCleaner \
io.github.arunsivaramanneo.GPUViewer io.github.lainsce.Khronos me.hyliu.fluentreader \
net.blockbench.Blockbench net.sourceforge.Hugin no.mifi.losslesscut nl.sarine.gpx-viewer\
org.entangle_photo.Manager org.gnome.Rhythmbox3 org.gnome.clocks org.godotengine.Godot org.gustavoperedo.FontDownloader	org.kde.Platform \
org.kde.haruna org.x.Warpinator re.sonny.Tangram vn.hoabinh.quan.CoBang org.telegram.desktop com.meetfranz.Franz org.gimp.GIMP \
org.gnome.SoundRecorder com.github.hugolabe.Wike flathub org.gnome.Connections us.zoom.Zoom org.remmina.Remmina org.blender.Blender com.microsoft.Teams \
org.kde.kdenlive -y

# appimage launcger, ksuperkey, appimagepool, pling KCM = plymouth, systemd, apper, calibrate touchscreen, byobu terminal CRT, 
# cuttle fish cpupower-gui graphor gcompris github desktop ,ghex glade, convertall, kvantum, minitube, plasmatube, simpleScreenrecorder
# Herioc game launcher, steam, qt, spotify, spotiflyer, tabby, timeshift, winetricks

sudo apt-get install ca-certificates git build-essential cmake gcc g++ libkf5config-dev libkf5auth-dev libkf5package-dev libkf5declarative-dev libkf5coreaddons-dev \
libkf5dbusaddons-dev libkf5kcmutils-dev libkf5i18n-dev libkf5plasma-dev libqt5core5a \
libqt5widgets5 libqt5gui5 libqt5qml5 extra-cmake-modules qtbase5-dev libkf5notifications-dev qml-module-org-kde-kirigami2 qml-module-qtquick-dialogs qml-module-qtquick-controls2 \
qml-module-qtquick-layouts qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel cmake build-essential gettext KCMUtils default-jdk openjdk-11-jre-headless openjdk-8-jre-headless -y

# qt5 tools/ Qt designer
sudo apt-get install python3-pyqt5 qtcreator pyqt5-dev-tools qttools5-dev-tools 

sudo snap install gitkraken --classic



# ! Build nohang from source, this method is not reliable 
# add-apt-repository ppa:oibaf/test
# apt update
# apt install nohang
# systemctl enable --now nohang-desktop.service


wget -q -O - https://gist.githubusercontent.com/Blastoise/72e10b8af5ca359772ee64b6dba33c91/raw/2d7ab3caa27faa61beca9fbf7d3aca6ce9a25916/clearType.sh | bash #Microsoft ClearType Fonts
wget -q -O - https://gist.githubusercontent.com/Blastoise/b74e06f739610c4a867cf94b27637a56/raw/96926e732a38d3da860624114990121d71c08ea1/tahoma.sh | bash #Tahoma and Segoe-UI Fonts
wget -q -O - https://gist.githubusercontent.com/Blastoise/64ba4acc55047a53b680c1b3072dd985/raw/6bdf69384da4783cc6dafcb51d281cb3ddcb7ca0/segoeUI.sh | bash
wget -q -O - https://gist.githubusercontent.com/Blastoise/d959d3196fb3937b36969013d96740e0/raw/429d8882b7c34e5dbd7b9cbc9d0079de5bd9e3aa/otherFonts.sh | bash #Other essential fonts

###################

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

########################

# CODE 

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list
rm microsoft.gpg
apt-get update
apt-get install -y code

# ! Plasma Shell [uncomment if want to install]
# sudo apt install kde-standard 

# sudo wget https://github.com/shiftkey/desktop/releases/download/release-2.9.3-linux3/GitHubDesktop-linux-2.9.3-linux3.deb
# sudo gdebi GitHubDesktop-linux-2.9.3-linux3.deb
# wget https://tlauncher.org/jar
# wget https://github.com/jely2002/youtube-dl-gui/releases/download/v2.4.0/Open-Video-Downloader-2.4.0.AppImage
# min browser 
# youtube-dl

echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list > /dev/null
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
sudo apt update && sudo apt install kwin-bismuth


sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install qt5-style-kvantum qt5-style-kvantum-themes

sudo add-apt-repository ppa:ernstp/mesarc
sudo apt-get update
sudo apt install corectrl

sudo add-apt-repository -y ppa:teejee2008/timeshift
sudo apt-get update
sudo apt-get install timeshift

# Fancontrol-GUI

mkdir $HOME/pkgs-msm
cd $HOME/pkgs-msm
git clone https://github.com/Maldela/fancontrol-gui.git
cd fancontrol-gui
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_KCM=on -DBUILD_PLASMOID=on
make -j
sudo make install
cd $HOME

######################


python3 -m pip install konsave
pip3 install -U guiscrcpy

########### Gaming Pkgs ###############
########### Virtualisation ################

# ! Procedure
# 1. wget and bash 
# 2. MSM configs copy and paste
# 3. Apply konsave theme

# ! Additional useful Pkgs
# - Notflix
# - AniCli
# - Aniancy and nohang