#!/bin/bash

# TITRE: hard_connect
#================================================================#
# DESCRIPTION: 
# Ceci est un script qui servira à connecter un disque dur phisique 
# sur une configuration virtuelle avec VirtualBox.
#----------------------------------------------------------------#
# AUTEURS: Daniel DOS SANTOS < danielitto91@gmail.com >
#----------------------------------------------------------------#
# DATE DE CRÉATION: 29/07/2018
#----------------------------------------------------------------#
# USAGE: ./hard_connect.sh
#----------------------------------------------------------------#
# BASH VERSION: GNU bash 4.4.12
#================================================================#
clear
apt-get update && apt-get upgrade -y
clear
#nom=$(w | grep tty* | cut -d" " -f1)
nom=$(logname)
usermod -G disk -a $nom

mkdir /home/$nom/VirtualDisk

cd /home/$nom/VirtualDisk

lsblk
echo ""
read -p "Choisir le nom du disque exemple sda, sdb... : " sd

dat=$(date '+%H%M')

VBoxManage internalcommands createrawvmdk -filename image$dat.vdi -rawdisk /dev/$sd

chown $nom:$nom image$dat.vdi
clear
echo -e "\n Il faut maintenant créer une machine sur virtualBox et ajouter le disque créé \n"
echo "Fin du script"
