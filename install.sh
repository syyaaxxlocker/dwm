#!/bin/bash


if [ "$(id -u)" == "0" ]; then
   echo "This script must not be run as root | Скрипт не может быть запущен от root'а"
   exit 1
fi 
if [ "$(uname -n)" != "archlinux"]; then
    echo "Installer only for arch. I use arch BTW"
    exit 1
fi

echo -en "Installing Requirements and Packages"
cd $HOME
sleep 1
sudo pacman -S ranger w3m xorg python-requests python-pip python3 python python-pywal python-beautifulsoup4\
     flameshot steam discord obs-studio code kate dmenu firefox wireplumber pipewire-pulse pipewire-alsa\
     lib32-pipewire pavucontrol wine-staging fastfetch wget fish ttf-font-awesome\
     telegram-desktop cmus clang flatpak libreoffice vlc mpv kdenlive obsidian feh qemu-full qbittorent



