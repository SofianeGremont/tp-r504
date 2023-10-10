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

step_build_image2() {
        chmod u+x build_image2.sh
        ./build_image2.sh
}

step_run-app() {
        chmod u+x run-app.sh
        ./run-app.sh
	docker stop tp4-app
}

step_run-app2() {
        chmod u+x run-app2.sh
        ./run-app2.sh
	docker stop tp4-app-2
	docker start tp4-app-2
}

run_step step_create_network
run_step step_run_mysql
echo "merci de patienter quelques secondes"
sleep 10
run_step step_filldb
run_step step_build_image
run_step step_build_image2
run_step step_run-app
run_step step_run-app2

echo "Le script a terminé avec succès."
echo "Le conteneur <tp4-app> est actuellement arrêté pour laisser le conteneur <tp4-app-2> fonctionné"
