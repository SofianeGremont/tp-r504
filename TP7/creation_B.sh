#!/bin/bash

while IFS=";" read v_nom v_passwd
do
    passwd=$(pwgen -1 8)
    echo "nom=$v_nom passwd=$passwd"
    echo "$v_nom:$passwd" | sudo chpasswd
done < liste3.txt
