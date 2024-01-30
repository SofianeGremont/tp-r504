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

step_build_image() {
        chmod u+x build_image.sh
        ./build_image.sh
}

step_run-app() {
        chmod u+x run-app.sh
        ./run-app.sh
}

run_step step_purge
run_step step_build_image
run_step step_run-app

echo "Le script a terminé avec succès."
