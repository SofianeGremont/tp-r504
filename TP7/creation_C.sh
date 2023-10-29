#!/bin/bash

function creation {
    local nom_utilisateur="$1"
    local mot_de_passe="$2"

    echo "Création de l'utilisateur $nom_utilisateur"
    sudo useradd -m -p "$mot_de_passe" "$nom_utilisateur"
}

creation test testps
