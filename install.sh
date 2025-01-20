#!/bin/bash

# Script para instalar y configurar bspwm, sxhkd, polybar y otras herramientas en Arch Linux
set -e  # Detener el script si ocurre un error

echo "Iniciando la instalación..."

# Verificar si el usuario tiene privilegios de root
if [ "$EUID" -ne 0 ]; then
    echo "Por favor, ejecuta este script con sudo o como root."
    exit 1
fi

# Actualizar sistema
pacman -Syu --noconfirm

# Instalar paquetes
PAQUETES=(
    bspwm sxhkd polybar rofi nitrogen pcmanfm
    ttf-hack-nerd ttf-jetbrains-mono-nerd brightnessctl
    mpv ffmpeg xorg-server xorg-xinit feh picom git
)

pacman -S --noconfirm "${PAQUETES[@]}"

# Crear configuraciones básicas
mkdir -p ~/.config/{bspwm,sxhkd,polybar}
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc
chmod +x ~/.config/bspwm/bspwmrc ~/.config/sxhkd/sxhkdrc

# Configurar .xprofile para ly
echo "Configurando ~/.xprofile para iniciar bspwm..."
cat > ~/.xprofile << EOF
#!/bin/bash
sxhkd &
exec bspwm
EOF
chmod +x ~/.xprofile
