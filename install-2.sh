#!/bin/bash

path=$(pwd)

echo "Beginning Installation..."

echo "Cloning yay Repository..."

git clone https://aur.archlinux.org/yay.git

cd yay

echo "Installing yay..."

makepkg --noconfirm -si

cd ..

rm -rf yay

echo "Installing AUR Packages..."

yay --noconfirm -S brave-bin minecraft-launcher discord nerd-fonts-inconsolata nerd-fonts-source-code-pro

# configure dotfiles and configs

echo "Cloning Dotfile Git Repository..."

git clone https://github.com/Aaron-Mann/config

echo "Copying wallpapers..."

cp -r config/wallpapers/ $HOME

echo "Creating .xinitrc file..."

echo "xrandr --output HDMI-1-0 --auto --right-of eDP-1" >> $HOME/.xinitrc
echo "feh --bg-fill --randomize ~wallpapers/" >> $HOME/.xinitrc
echo "exec dwm" >> $HOME/.xinitrc

echo "Creating .bashrc file..."

echo "neofetch" >> $HOME/.bashrc

echo "Creating Symlinks to '.config' Directory..."

[ ! -d $HOME/.config ] && mkdir $HOME/.config

[ -d $HOME/.config/alacritty ] && rm -rf $HOME/.config/alacritty
cp -r $path/config/config/alacritty $HOME/.config/alacritty

cp -r $path/config/config/vim/.vimrc $HOME/.vimrc

echo "Congragulations! Installation is complete!"
echo ""
echo "Now, type 'startx' to enter dwm and begin computing!"
