#!/usr/bin/bash

if [ -z "$1" ]; then
    echo "Aucune lettre en argument"
    exit 1
fi

find /etc -maxdepth 1 -type f -name "$1*" -exec file {} \;
