#!/bin/bash

# TITRE: hard_connect
#================================================================#
# DESCRIPTION: 
# Ceci est un script qui servira à connecter un disque dur phisique 
# sur une configuration virtuelle avec VirtualBox.
#----------------------------------------------------------------#
# AUTEURS: Daniel DOS SANTOS < danielitto91@gmail.com >
#----------------------------------------------------------------#
# USAGE: ./hard_connect.sh
#================================================================#

usertos=$(w | awk '{print $1}' | awk 'NR==3')
apt-get update && apt-get upgrade -y
clear
usermod -G disk -a $usertos

mkdir /home/$usertos/VirtualDisk

cd /home/$usertos/VirtualDisk

lsblk
echo ""
read -p "Choisir le nom du disque exemple sda, sdb... : " sdsd

datime=$(date '+%H%M')

VBoxManage internalcommands createrawvmdk -filename image$dat.vdi -rawdisk /dev/$sdsd

chown $usertos:$usertos image$datime.vdi
clear
echo -e "\n Il faut maintenant ajouter le disque créé à une VM \n"
echo "Fin du script"
