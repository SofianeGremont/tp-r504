from flask import Flask, render_template, request
import re

app = Flask(__name__)

# Expression régulière pour la validation du nom d'utilisateur
regex_nom_utilisateur = re.compile(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$')

@app.route('/')
def index():
    return render_template('nouvel_utilisateur.html', message=None)

@app.route('/newuser/', methods=['GET', 'POST'])
def nouvel_utilisateur():
    message = None

    if request.method == 'POST':
        nom_utilisateur = request.form.get('nom_utilisateur')

        if nom_utilisateur:
            if regex_nom_utilisateur.match(nom_utilisateur):
                message = f'Le nom d\'utilisateur "{nom_utilisateur}" est valide !'
            else:
                # Construction du message d'erreur détaillé
                message = 'Nom d\'utilisateur invalide. Veuillez suivre les critères suivants :'
                if len(nom_utilisateur) < 6:
                    message += ' - Au moins 6 caractères'
                if not any(c.isdigit() for c in nom_utilisateur):
                    message += ' - Au moins 1 chiffre'
                if not any(c.isupper() for c in nom_utilisateur):
                    message += ' - Au moins 1 majuscule'

    return render_template('nouvel_utilisateur.html', message=message)

if __name__ == '__main__':
    app.run(debug=True)
