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
pipx ensurepath
pipx install $(cat pipx-packages.txt)
fisher install $(cat fisher-packages.txt)

# install hypr
# yay -S --needed $(cat hypr-packages.txt)

# set defaults
chsh -s $(which fish)

# astronvim setup
mv ~/.config/nvim ~/.config/nvim.bak
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
git clone https://github.com/Paveun/astronvim_user ~/.config/nvim/lua/user

# conda config
conda config --set auto_activate_base false

# link dotfiles
stow home
