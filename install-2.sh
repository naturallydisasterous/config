#!/bin/bash

path=$(pwd)

echo "Beginning Installation..."

echo "Cloning yay Repository..."

git clone https://aur.archlinux.org/paru.git

cd paru

echo "Installing paru..."

makepkg --noconfirm -si

cd ..

rm -rf paru

echo "Installing AUR Packages..."

paru --noconfirm -S brave-bin minecraft-launcher discord nerd-fonts-inconsolata nerd-fonts-source-code-pro steam-fonts

# configure dotfiles and configs

echo "Cloning Dotfile Git Repository..."

git clone https://github.com/Aaron-Mann/config

echo "Copying wallpapers..."

cp -r config/wallpapers/ $HOME

echo "Creating .xinitrc file..."

echo "feh --bg-fill --randomize ~wallpapers/" >> $HOME/.xinitrc
echo "exec spectrwm" >> $HOME/.xinitrc

echo "Creating .bashrc file..."

echo "neofetch" >> $HOME/.bashrc

echo "Creating Symlinks to '.config' Directory..."

[ ! -d $HOME/.config ] && mkdir $HOME/.config

[ -d $HOME/.config/alacritty ] && rm -rf $HOME/.config/alacritty
cp -r $path/config/config/alacritty $HOME/.config/alacritty

cp -r $path/config/config/vim/.vimrc $HOME/.vimrc

cp -r $path/config/.spectrwm.conf $HOME/.spectrwm.conf

echo "Congragulations! Installation is complete!"
echo ""
echo "Now, type 'startx' to enter dwm and begin computing!"
