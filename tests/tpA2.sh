#!/usr/bin/bash

if [ "$1" == "" ]; then
        echo "Pas d'argument"
	exit
fi


if [ "$1" == "$USER" ]; then
	echo "OUI"
else
	echo "NON"
fi
