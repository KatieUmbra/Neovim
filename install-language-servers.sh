#!/usr/bin/sh

if [ -x "$(command -v yay)" ]
then
	echo "Found yay, using it."
	yay --needed --noconfirm -S - < LSPS
	exit 0
elif [ -x "$(command -v paru)" ]
then
	echo "Found paru, using it."
	paru --needed --noconfirm -S - < LSPS
	exit 0
else
	>&2 echo "No valid AUR helper found."
	exit 1
fi
