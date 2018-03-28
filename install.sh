#!/bin/bash
echo "Copying configs to their appropriate directories.."
cd "$(dirname "$0")"
mkdir -p ~/.config/i3 && cp -r ./i3/ ~/.config/i3/
mkdir -p ~/.config/polybar && cp -r ./polybar/ ~/.config/polybar/
mkdir -p ~/.config/termite && cp -r ./termite/ ~/.config/termite/
mkdir -p ~/.config/rofi && cp -r ./rofi/ ~/.config/rofi/
mkdir -p ~/.config/neofetch && cp -r ./neofetch/ ~/.config/neofetch/
mkdir -p ~/.colors && cp -r ./colors/ ~/.colors/
mkdir -p ~/Pictures && cp -r ./Pictures/ ~/Pictures/
cp -r ./compton/ ~/.config/
cp -r ./x/ ~/
echo "Done."
