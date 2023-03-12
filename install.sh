#!/bin/bash


echo "++++++++++++++++++++++++++++++++++++++"
echo " "
echo "     Comienzo instalación paquetes"
echo " "
echo "            Jorge-Bspm                "
echo "++++++++++++++++++++++++++++++++++++++"
sleep 2



# Actualizar los repositorios y el sistema

# Solicita la contraseña de superusuario
sudo -S echo "Actualizando los paquetes..."
sudo pacman -Syu

sleep 2

# Instalar base-devel, bspwm, sxhkd, polybar, rofi, pcmanfm, lxappearance y nitrogen
sudo pacman -S base-devel git wget bspwm sxhkd polybar rofi pcmanfm lxappearance nitrogen moc mpv alacritty fish

sleep 2




echo " Instalando yay"
sleep 2 
# Clonar el repositorio de yay en el directorio temporal
cd /tmp
git clone https://aur.archlinux.org/yay.git

# Cambiar al directorio del repositorio clonado
cd yay

# Compilar e instalar yay
makepkg -si

sleep 2

echo " Instalando ly"
sleep 2

# Aur ly
exit 
 yay -S ly
 systemctl enable ly.service

# Crea el directorio y clona el repositorio de configuración de BSPWM desde GitHub

mkdir git_things
cd git_things
git clone https://github.com/Jorpy76/config_archlinux_Bspwm.git


# Copiando los config

echo " Instalando los configs"
sleep 2

sudo -S echo "Copiando los archivos .config"

cp -R git_things/* ./config/

sleep 2

# Reiniciar sistema
echo " Reiniciando sistema"
sleep2 

sudo pacman -S pkgfile ttf dejavu powerline-fonts inetutils
nano .bashrc
echo "exec fish" >> ~/.bashrc

sudo reboot

