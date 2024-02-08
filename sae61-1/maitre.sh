#!/bin/bash

run_step() {
    echo "Exécution de l'étape : $1"
    if $1; then
        echo "Étape réussie : $1"
    else
        echo "Erreur lors de l'exécution de l'étape : $1"
        exit 1
    fi
}

step_purge() {
	chmod u+x purge.sh
	./purge.sh
}

step_create_network() {
	chmod u+x create_network.sh
	./create_network.sh
}

step_run_mysql() {
	chmod u+x run_mysql.sh
	./run_mysql.sh
}

step_filldb() {
	chmod u+x filldb.sh
	./filldb.sh
}

step_build_image() {
        chmod u+x build_image.sh
        ./build_image.sh
}

step_run-app() {
        chmod u+x run-app.sh
        ./run-app.sh
}

run_step step_purge
run_step step_create_network
run_step step_run_mysql
echo "merci de patienter quelques secondes"
sleep 45
run_step step_filldb
run_step step_build_image
run_step step_run-app

echo "Le script a terminé avec succès."
echo "Connexion : 0.0.0.0:5000"
