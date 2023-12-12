#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 comic_number"
    exit 1
fi

comic_number=$1
comic_url="http://xkcd.com/$comic_number/"

# Télécharger la page web
wget -q -O - "$comic_url" | \
    # Extraire l'URL de l'image du tag meta
    grep -oP '<meta property="og:image" content="\K[^"]+' | \
    # Séparer la ligne en différents champs
    IFS='/' read -ra url_parts

# Construire l'URL complète de l'image
image_url="https://${url_parts[2]}/${url_parts[3]}/${url_parts[4]}/${url_parts[5]}"

# Télécharger l'image
wget -q -O comic.png "$image_url"

# Afficher l'image
xdg-open comic.png

exit 0

