#!/bin/bash

# Vérifier le nombre d'arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <chemin_absolu>"
    exit 1
fi

# Récupérer le chemin passé en argument
chemin_absolu=$1

# Vérifier l'existence du chemin
if [ ! -e "$chemin_absolu" ]; then
    echo "Chemin invalide, $chemin_absolu n'existe pas."
    exit 1
fi

# Extraire les composants du chemin
IFS='/' read -ra chemin_composants <<< "$chemin_absolu"

# Initialiser la variable de chemin courant
chemin_courant="/"

# Parcourir les composants du chemin
for dossier in "${chemin_composants[@]}"; do
    # Ignorer les composants vides
    if [ -z "$dossier" ]; then
        continue
    fi

    # Construire le chemin en cours
    chemin_courant="$chemin_courant$dossier/"

    # Vérifier l'existence du dossier
    if [ ! -d "$chemin_courant" ]; then
        echo "Chemin invalide, le dossier $dossier n'existe pas dans $chemin_courant"
        exit 1
    fi
done

# Si tout est vérifié, afficher "chemin valide"
echo "Chemin valide"

