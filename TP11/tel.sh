#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <comic_number>"
  exit 1
fi

comic_number=$1
comic_url="http://xkcd.com/$comic_number/"

wget -q -O xkcd_page.html "$comic_url"

image_url=$(grep -oP '<meta property="og:image" content="\K[^"]+' xkcd_page.html)

wget -q "$image_url" -O xkcd_comic.png

xdg-open xkcd_comic.png

sleep 5

rm xkcd_page.html xkcd_comic.png
