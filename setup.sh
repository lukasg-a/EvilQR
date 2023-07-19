#!/bin/bash

#Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function ctrl_c(){
	echo -e "\n\n${redColour}[!] Saliendo...${endColour}"
	tput cnorm; exit 1
}

trap ctrl_c INT

# Comprobamos si el usuario es root.

if [ $(id -u) -ne 0 ]; then
	echo -e "\n${redColour}[!] Debes ejecutar el script como root...${endColour}\n"
	exit 1
fi

echo -e "\n${redColour}[+]${endColour} ${grayColour}Instalando requerimientos necesarios...${endColour}\n"
sleep 1
echo -e "\n${redColour}[+]${endColour} ${grayColour}Updating...${endColour}\n"
apt update -y &>/dev/null
echo -e "\n${redColour}[+]${endColour} ${grayColour}Instalando eog...${endColour}\n"
apt install eog -y &>/dev/null
echo -e "\n${redColour}[+]${endColour} ${grayColour}Instalando qrencode...${endColour}\n"
apt install qrencode -y &>/dev/null
echo -e "\n${redColour}[+]${endColour} ${grayColour}Configurando EvilQR...${endColour}\n"
chmod +x EvilQR
cp EvilQR /usr/bin/
sleep 2
echo -e "\n${redColour}[+]${endColour} ${grayColour}Listo.${endColour}\n"
echo -e "\t\t${yellowColour}Use: EvilQR${endColour}"
