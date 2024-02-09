#!/bin/bash

# updates
sudo pacman -Syu

# setup yay - aur helper
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si 
cd ..
rm -rf yay

# install packages
yay -S --needed $(cat packages.txt)
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y $(cat flatpak-packages.txt)

# set defaults
chsh -s $(which fish)

# astronvim setup
mv ~/.config/nvim ~/.config/nvim.bak
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
git clone https://github.com/Paveun/astronvim_user ~/.config/nvim/lua/user

# link dotfiles
stow home
