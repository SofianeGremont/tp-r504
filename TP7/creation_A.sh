#!/bin/bash

if ! getent group t_users >/dev/null; then
    sudo groupadd t_users
fi

for username in $(cat liste1.txt); do
    sudo adduser --disabled-password --gecos "" --ingroup t_users "$username"
done
echo "Tous les utilisateurs ont été créés et ajoutés au groupe t_users."
