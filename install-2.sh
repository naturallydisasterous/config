#!/bin/bash

path=$(pwd)

echo "Beginning Installation..."

echo "Cloning mimicwm Repository..."

git clone https://github.com/Aaron-Mann/mimicwm

echo "Building mimicwm..."

cd mimicwm

sudo make clean install

cd ..

echo "Cloning yay Repository..."

git clone https://aur.archlinux.org/yay.git

cd yay

echo "Installing yay..."

makepkg --noconfirm -si

cd ..

rm -rf yay

echo "Installing AUR Packages..."

yay --noconfirm -S brave-bin minecraft-launcher discord

echo "Configuring Emacs..."

# configure doom emacs

git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d

~/.emacs.d/bin/doom install

# configure dotfiles and configs

echo "Cloning Dotfile Git Repository..."

git clone https://github.com/Aaron-Mann/config

echo "Creating .xinitrc file..."

echo "xwallpaper --zoom $HOME/.wallpaper.jpeg" >> $HOME/.xinitrc
echo "picom &" >> $HOME/.xinitrc
echo "exec mimicwm" >> $HOME/.xinitrc

echo "Creating .bashrc file..."

echo "neofetch" >> $HOME/.bashrc

echo "Creating Symlinks to '.config' Directory..."

[ ! -d $HOME/.config ] && mkdir $HOME/.config

[ -d $HOME/.config/alacritty ] && rm -rf $HOME/.config/alacritty
cp -r $path/config/config/alacritty $HOME/.config/alacritty

[ -d $HOME/.config/nvim ] && rm -rf $HOME/.config/nvim
cp -r $path/config/config/nvim $HOME/.config/nvim

cp -r $path/config/.wallpaper.jpg $HOME/.wallpaper.jpg

echo "Congragulations! Installation is complete!"
echo ""
echo "Now, type 'startx' to enter xmonad and begin computing!"
