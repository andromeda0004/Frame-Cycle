#!/bin/bash

HOUR=$(date +%H)

WALLPAPER_DIR="/home/$USER/Pictures/Wallpapers"

MORNING="$WALLPAPER_DIR/morning.jpg"
AFTERNOON="$WALLPAPER_DIR/afternoon.jpg"
EVENING="$WALLPAPER_DIR/evening.jpg"
NIGHT="$WALLPAPER_DIR/night.jpg"

function set_wallpaper() {

    if [ -n "$(pgrep -u "$USER" gnome-shell)" ]; then
        gsettings set org.gnome.desktop.background picture-uri "file://$1"
        gsettings set org.gnome.desktop.background picture-options 'zoom'
        echo "Set wallpaper for GNOME"
        return 0
    fi

    if [ -n "$(pgrep -u "$USER" cinnamon)" ]; then
        gsettings set org.cinnamon.desktop.background picture-uri "file://$1"
        gsettings set org.cinnamon.desktop.background picture-options 'zoom'
        echo "Set wallpaper for Cinnamon"
        return 0
    fi

    if [ -n "$(pgrep -u "$USER" mate-session)" ]; then
        gsettings set org.mate.background picture-filename "$1"
        echo "Set wallpaper for MATE"
        return 0
    fi

    if [ -n "$(pgrep -u "$USER" xfce4-session)" ]; then
        for prop in $(xfconf-query -c xfce4-desktop -l | grep last-image); do
            xfconf-query -c xfce4-desktop -p "$prop" -t string -s "$1"
        done
        echo "Set wallpaper for XFCE"
        return 0
    fi

#hi so if any window manager does not exist, feh comes into play. feh is just another software for setting wallpapers btw. do sudo apt install feh and you should be good to go for debian based systems, or any other package managers you use idk
    if command -v feh &> /dev/null; then
        feh --bg-fill "$1"
        echo "Set wallpaper with feh"
        return 0
    fi

    echo "Could not find a supported desktop environment or wallpaper tool."
    return 1
}

WALLPAPER_TO_SET=""
case "$HOUR" in
    0[6-9]|1[0-1])
        WALLPAPER_TO_SET="$MORNING"
        ;;
    1[2-7])
        WALLPAPER_TO_SET="$AFTERNOON"
        ;;
    1[8-9]|2[0-1])
        WALLPAPER_TO_SET="$EVENING"
        ;;
    *)
        WALLPAPER_TO_SET="$NIGHT"
        ;;
esac

set_wallpaper "$WALLPAPER_TO_SET"