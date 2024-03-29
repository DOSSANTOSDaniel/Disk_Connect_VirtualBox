#!/bin/bash

# TITRE: hard_connect
#================================================================#
# DESCRIPTION: 
# Ceci est un script qui servira à connecter un disque dur physique
# sur une configuration virtuelle avec Virtualbox.
#----------------------------------------------------------------#
# AUTEURS: Daniel DOS SANTOS < danielitto91@gmail.com >
#----------------------------------------------------------------#
# USAGE: ./hard_connect.sh
#================================================================#

usertos=$(w | awk '{print $1}' | awk 'NR==3')
chemin=/home/"$usertos"/VirtualDisk/
sudo apt-get update && apt-get upgrade -y
clear

sudo usermod -G disk -a "$usertos"
sudo usermod -G vboxuser -a "$usertos"
#newgrp vboxuser 
#newgrp disk
#Il faut reboot !

#mkdir "$chemin"

#lsblk
#echo ""
#read -p "Choisir le nom du disque exemple sda, sdb... : " sdsd

#VBoxManage internalcommands createrawvmdk -filename "$chemin"Disk1.vdi -rawdisk /dev/"$sdsd"

#clear

# détection du port utilisé par le contrôleur
# sur quel contrôleur agir
#vboxmanage showvminfo Debian | grep "Storage Controller Name"

# sur quel port agir


#vboxmanage list vms
#echo ""
#read -p "Sur quelle vm attacher ce nouveau disque ? " nomVM
######################vboxmanage storagectl "$nomVM" --name "SATA Controller" --add sata --controller IntelAHCI --portcount 1 --bootable on
#vboxmanage storageattach "$nomVM" --storagectl "SATA" --device 0 --port 2 --type hdd --medium "$chemin"Disk1.vdi
#echo "Fin du script"
