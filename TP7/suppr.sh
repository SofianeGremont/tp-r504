#!/bin/bash

for username in $(cat liste1.txt); do
    if id "$username" &>/dev/null; then
        sudo userdel -r "$username"
        echo "L'utilisateur $username a été supprimé."
    else
        echo "L'utilisateur $username n'existe pas."
    fi
done

if getent group t_users >/dev/null; then
    sudo groupdel t_users
    echo "Le groupe t_users a été supprimé."
else
    echo "Le groupe t_users n'existe pas."
fi

echo "Tous les utilisateurs ont été supprimés et le groupe t_users a été supprimé le cas échéant."
