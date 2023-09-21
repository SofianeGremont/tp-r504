#!/usr/bin/bash

if [ -z "$1" ]; then
    echo "Aucun argument"
    exit 1
fi

if [ "$1" -ge 10 ]; then
    echo "L'argument doit être inférieur à 10."
    exit 1
fi

n="$1"

for ((i=1; i<=n; i++)); do
    dossier="a$i"
    mkdir -p ~/"$dossier"
    fichier=~/"$dossier"/log.txt
    date "+%Y-%m-%d %H:%M:%S" > "$fichier"
done
