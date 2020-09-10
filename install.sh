# Configuration preperation

pacman -Syy sudo git base-devel wget

git clone https://aur.archlinux.org/yay-git.git

cd yay

makepkg -si

cd ..

# UX configuration

pacman -Syy xorg xorg-xinit bspwm sxhkd xwallpaper picom

yay -S polybar

mkdir ~/.config/bspwm
cp /src/bspwm/bspwmrc ~/.config/bspwm/

mkdir ~/.config/sxhkd
cp /src/sxhkd/sxhkdrc ~/.config/sxhkd/

mkdir .config/polybar
cp /src/polybar/launch.sh ~/.config/polybar/
cp /src/polybar/config ~/.config/polybar/
chmod +x ~/.config/polybar/launch.sh

cp /src/xinit/.xinitrc ~/

# Application Installation

pacman -S Alacritty vim vlc

yay -S brave-bin

yay -S spotify

# Config Install

curl -LO https://wallpapercave.com/wp/wp4489090.jpg

cp wp4489090.jpg ~/
