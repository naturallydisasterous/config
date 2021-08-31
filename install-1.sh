#!/bin/bash
path=$(pwd)

pause=1
pause2=1

while [ $pause == 1 ]
do
	echo "What would you like your username to be?"
	read USER
	read -p "You have chosen $USER for your name. Are you sure? [y/N]" yn
	case $yn in
		[Yy]* ) pause=0 ;;
		[yes]* ) pause=0 ;;
		[Yes]* ) pause=0 ;;
	esac
done

useradd -m -g wheel -s /bin/bash $USER
passwd $USER

echo "User Account Configured."

echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

echo "Wheel group no longer needs root password to execute sudo."

echo "Enabling Multilib..."

echo "#[multilib]" >> /etc/pacman.conf
echo "#Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

Echo "Done."

Echo "Updating and installing core packages..."

pacman --noconfirm -Syu
pacman --noconfirm -Syy networkmanager ripgrep sudo git base-devel wget curl xorg xorg-xinit feh dmenu picom alacritty vim alsa alsa-utils neofetch steam

Echo "Done."

systemctl enable NetworkManager
systemctl start NetworkManager

cp install-2.sh /home/$USER/install-2.sh

echo "Root system level configuration has been completed."
echo " "
echo "Please log out of root (with ctrl-d), and log into your system as '$USER' and run the following command:"
echo ""
echo "bash install-2.sh"
