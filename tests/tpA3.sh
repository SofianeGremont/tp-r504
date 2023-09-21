#!/usr/bin/bash

if [ -z "$1" ]; then
    debut=5
else
    debut="$1"
fi

if [ -z "$2" ]; then
    if [ -z "$1" ]; then
        fin=15
    else
        fin=$((debut + 10))
    fi
else
    fin="$2"
fi

for ((i=debut; i<=fin; i++)); do
    echo "$i"
done

