#!/bin/bash

path=$(pwd)

pulseaudio --start

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg --noconfirm -si

cd ..

rm -rf yay

yay --noconfirm -S polybar brave-bin spotify

# configure doom emacs

git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d

~/.emacs.d/bin/doom install

# configure dotfiles and configs

echo "Copying Dotfiles"

echo "exec bspwm" >> $HOME/.xinitrc

git clone https://github.com/Aaron-Mann/config

cp $path/config/src/bspwm/bspwmrc $HOME/.config/bspwm/bspwmrc
cp $path/config/src/sxhkd/sxhkdrc $HOME/.config/sxhkd/sxhkdrc



mkdir $HOME/.config/polybar/

cp $path/config/src/polybar/launch.sh $HOME/.config/polybar/launch.sh
cp $path/config/src/polybar/config $HOME/.config/polybar/config

cp $path/config/src/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
