from flask import Flask, render_template, request, redirect, url_for
import re
import hashlib
import mysql.connector

app = Flask(__name__)

# Configuration de la base de données
DATABASE = {
    'host': 'sae61-sql',
    'user': 'root',
    'password': 'foo',
    'database': 'sae61',
    'port': '3306'
}

# Expressions régulières pour la validation des saisies
username_regex = re.compile(r'^[a-z0-9]{6,10}$')
password_regex = re.compile(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[%#@{}])[a-zA-Z0-9#@{}%]{6,15}$')
email_regex = re.compile(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/newuser/', methods=['GET', 'POST'])
def new_user():
    error = None

    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']

        # Validation des saisies
        if not username_regex.match(username):
            error = 'L\'identifiant doit contenir entre 6 et 10 caractères alphanumériques en minuscules.'
        elif not password_regex.match(password):
            error = 'Le mot de passe doit contenir entre 6 et 15 caractères avec au moins un chiffre, une majuscule, une minuscule et un des caractères : %#@{}.'
        elif not email_regex.match(email):
            error = 'L\'adresse e-mail n\'est pas valide.'
        else:
            # Connexion à la base de données et insertion de l'utilisateur
            db = get_db()
            cursor = db.cursor()
            hashed_password = hashlib.sha256(password.encode()).hexdigest()
            cursor.execute('INSERT INTO users (username, password, email) VALUES (%s, %s, %s)', (username, hashed_password, email))
            db.commit()
            cursor.close()

            # Création d'un cookie de connexion
            response = redirect(url_for('success'))
            response.set_cookie('identifiant', username)

            return response

    return render_template('newuser.html', error=error)

@app.route('/success')
def success():
    return render_template('success.html')

# Fonction pour se connecter à la base de données
def get_db():
    return mysql.connector.connect(**DATABASE)

if __name__ == '__main__':
    app.run(debug=True)

