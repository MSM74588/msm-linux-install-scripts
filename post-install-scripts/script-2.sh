#!/bin/bash
# bash <(wget -nv -O - https://raw.githubusercontent.com/MSM74588/msm-linux-install-scripts/main/post-install-scripts/script-2.sh)

sudo apt install -y curl git python3 python3-pip software-properties-common ttf-mscorefonts-installer ca-certificates \
gnome-disk-utility akira anjuta mpv kamoso htop neofetch grub-customizer stacer openssh-server synaptic latexila modem-manager-gui kubuntu-restricted-extras \
lm-sensors hwinfo dconf-editor gdebi pulseaudio pavucontrol pavucontrol kde-config-plymouth kde-config-systemd kde-config-cron kde-config-tablet \
kde-config-updates kde-config-whoopsie kde-config-fcitx kde-config-fcitx5 kde-config-gtk-style kde-config-gtk-style-preview winetricks simplescreenrecorder \
cpupower-gui minitube ghex cool-retro-term 	convertall filelight


sudo flatpak install flathub com.axosoft.GitKraken com.belmoussaoui.Decoder \
com.belmoussaoui.Obfuscate com.discordapp.Discord com.gigitux.youp com.github.Flacon \
com.github.alexhuntley.Plots com.github.calo001.fondo com.github.donadigo.appeditor com.github.fabiocolacio.marker \
com.github.iwalton3.jellyfin-media-player com.github.liferooter.textpieces com.github.taiko2k.tauonmb com.github.unrud.RemoteTouchpad \
com.github.xournalpp.xournalpp com.jgraph.drawio.desktop com.rafaelmardojai.Blanket com.leinardi.gwe com.rafaelmardojai.SharePreview \
com.spotify.Client com.usebottles.bottles de.haeckerfelix.AudioSharing fr.romainvigier.MetadataCleaner \
io.github.arunsivaramanneo.GPUViewer io.github.lainsce.Khronos me.hyliu.fluentreader \
net.blockbench.Blockbench net.sourceforge.Hugin no.mifi.losslesscut nl.sarine.gpx-viewer \
org.entangle_photo.Manager org.gnome.Rhythmbox3 org.gnome.clocks org.godotengine.Godot org.kde.Platform \
org.kde.haruna org.x.Warpinator re.sonny.Tangram vn.hoabinh.quan.CoBang org.telegram.desktop com.meetfranz.Franz org.gimp.GIMP \
org.gnome.SoundRecorder com.github.hugolabe.Wike flathub org.gnome.Connections us.zoom.Zoom org.remmina.Remmina org.blender.Blender com.microsoft.Teams \
org.gaphor.Gaphor com.github.Matoking.protontricks app.getspace.Space org.coolero.Coolero \
org.kde.kdenlive io.github.prateekmedia.appimagepool -y
# appimage launcger, ksuperkey, appimagepool, pling KCM = plymouth, systemd, apper, calibrate touchscreen, byobu terminal CRT, 
# cuttle cpupower-gui graphor gcompris github desktop ,ghex glade, convertall, kvantum, minitube, plasmatube, simpleScreenrecorder
# Herioc game launcher, steam, qt, spotify, spotiflyer, tabby, timeshift, winetricks

sudo flatpak install flathub com.bitwig.BitwigStudio


sudo apt-get -y install ca-certificates git build-essential cmake gcc g++ libkf5config-dev libkf5auth-dev libkf5package-dev libkf5declarative-dev libkf5coreaddons-dev \
libkf5dbusaddons-dev libkf5kcmutils-dev libkf5i18n-dev libkf5plasma-dev libqt5core5a \
libqt5widgets5 libqt5gui5 libqt5qml5 extra-cmake-modules qtbase5-dev libkf5notifications-dev qml-module-org-kde-kirigami2 qml-module-qtquick-dialogs qml-module-qtquick-controls2 \
qml-module-qtquick-layouts qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel cmake build-essential gettext KCMUtils default-jdk openjdk-11-jre-headless openjdk-8-jre-headless \
q4wine libgstreamer1.0-dev libgstreamer-plugins-bad1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev 

# qt5 tools/ Qt designer
sudo apt-get -y install python3-pyqt5 qtcreator pyqt5-dev-tools qttools5-dev-tools 

sudo snap install gitkraken --classic


cd $HOME/Desktop
git clone https://github.com/MSM74588/msm-linux-install-scripts.git 
cd $HOME

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

sudo apt-get -y install fonts-cantarell ttf-ubuntu-font-family git
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
sudo apt-get update
sudo apt-get install -y code

# ! Plasma Shell [uncomment if want to install]
# sudo apt install kde-standard 

mkdir $HOME/Desktop/manual-install-pkgs
cd $HOME/Desktop/manual-install-pkgs
wget \
https://github.com/shiftkey/desktop/releases/download/release-2.9.3-linux3/GitHubDesktop-linux-2.9.3-linux3.deb https://tlauncher.org/jar \
https://github.com/jely2002/youtube-dl-gui/releases/download/v2.4.0/Open-Video-Downloader-2.4.0.AppImage \
https://github.com/minbrowser/min/releases/download/v1.22.2/min_1.22.2_amd64.deb \
https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb \
https://github.com/popcorn-official/popcorn-desktop/releases/download/v0.4.6/Popcorn-Time-0.4.6-amd64.deb \
https://github.com/Shabinder/SpotiFlyer/releases/download/v3.5.0/spotiflyer_3.5.0-1_amd64.deb \
https://github.com/responsively-org/responsively-app/releases/download/v0.18.0/ResponsivelyApp-0.18.0.AppImage \
https://github.com/sharkwouter/minigalaxy/releases/download/1.1.0/minigalaxy_1.1.0_all.deb \
https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.0.2/Heroic-2.0.2.AppImage \
https://github.com/GloriousEggroll/proton-ge-custom/releases/download/7.0rc3-GE-1/Proton-7.0rc3-GE-1.tar.gz \
https://github.com/weiameili/Pensela/releases/download/v1.1.3/pensela_1.1.3_amd64.deb \
https://github.com/notion-enhancer/notion-repackaged/releases/download/v2.0.18-1/notion-app-enhanced_2.0.18-1_amd64.deb


wget -O ~/steam.deb http://media.steampowered.com/client/installer/steam.deb

cd $HOME

#youtube-dl
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list > /dev/null
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
sudo apt update && sudo apt install kwin-bismuth


sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install -y qt5-style-kvantum qt5-style-kvantum-themes

sudo add-apt-repository ppa:ernstp/mesarc
sudo apt-get update
sudo apt install -y corectrl

sudo add-apt-repository -y ppa:teejee2008/timeshift
sudo apt-get update
sudo apt-get install -y timeshift

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

# Pip3 required to restart
python3 -m pip install konsave #this requires restart
pip3 install -U guiscrcpy

########### Gaming Pkgs ###############
# configured for Steam, minigalaxy, winetricks, wine, lutrus
#

# lutrius
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update
sudo apt install -y lutris

# wine
sudo dpkg --add-architecture i386  
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' 
sudo apt-get update

sudo add-apt-repository ppa:cybermax-dexter/sdl2-backport
sudo apt-get update
sudo apt-get install --install-recommends winehq-stable

echo "alias protontricks='flatpak run com.github.Matoking.protontricks'" >> ~/.bashrc 


########### Android ###############
sudo apt-get install -y android-tools-adb android-tools-fastboot
sudo snap install --devmode --beta anbox

########### Virtualisation ################
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
sudo adduser $whoami libvirt
sudo adduser $whoami kvm


# ! Procedure
# 1. wget and bash 
# 2. MSM configs copy and paste
# 3. Apply konsave theme

# ! Additional useful Pkgs
# - Notflix
# - AniCli
# - Aniancy and nohang

# KsuperKey
cd $HOME/pkgs-msm
git clone https://github.com/hanschen/ksuperkey.git
sudo apt-get install -y git gcc make libx11-dev libxtst-dev pkg-config
cd ksuperkey
make
sudo make install


# Install Nerd fonts

#setup marker
git clone --depth=1 https://github.com/pindexis/marker ~/.marker && ~/.marker/install.py


curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish




echo "[COMPLETED] Script completed! Initial setup done!"
