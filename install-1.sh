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

while [ $pause2 == 1 ]
do
	echo "Enter a password for the $USER account:"
	read PSWD
	read -p "You have chosen $PSWD for your password. Are you sure? [y/N]" yn
	case $yn in
		[Yy]* ) pause2=0 ;;
		[yes]* ) pause2=0 ;;
		[Yes]* ) pause2=0 ;;
	esac
done

useradd -m -g wheel -s /bin/bash $USER
passwd $PSWD

echo "User Account Configured."

echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

echo "Wheel group no longer needs root password to execute sudo."



pacman --noconfirm --needed -Syy networkmanager ripgrep sudo git base-devel wget curl xorg xorg-xinit xwallpaper picom Alacritty vim emacs pulseaudio

systemctl enable NetworkManager
systemctl start NetworkManager

cp install-2.sh /home/$USER/install-2.sh

echo "Root system level configuration has been completed."
echo ""
echo "Please log out of root (with ctrl-d), and log into your system as '$USER' with the password '$PSWD' and run the following command:
echo ""
echo "bash install-2.sh"
