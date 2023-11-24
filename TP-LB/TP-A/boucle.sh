#!/bin/bash

for ((i=1; i<=500; i++)); do
    reponse=$(curl -s http://localhost:83)

    if [[ "$reponse" == *"Hello 1"* ]]; then
        ((count_server_1++))
    elif [[ "$reponse" == *"Hello 2"* ]]; then
        ((count_server_2++))
    else
        echo "Réponse inattendue : $reponse"
    fi
done

echo "Réponses de nginx1 (port:81): $count_server_1"
echo "Réponses de nginx2 (port:82): $count_server_2"
