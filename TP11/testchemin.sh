#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <chemin_absolu>"
    exit 1
fi

chemin_absolu=$1

if [ ! -e "$chemin_absolu" ]; then
    echo "Chemin invalide, $chemin_absolu n'existe pas."
    exit 1
fi

IFS='/' read -ra chemin_composants <<< "$chemin_absolu"

chemin_courant="/"

for dossier in "${chemin_composants[@]}"; do
    if [ -z "$dossier" ]; then
        continue
    fi

    chemin_courant="$chemin_courant$dossier/"

    if [ ! -d "$chemin_courant" ]; then
        echo "Chemin invalide, le dossier $dossier n'existe pas dans $chemin_courant"
        exit 1
    fi
done

echo "Chemin valide"

