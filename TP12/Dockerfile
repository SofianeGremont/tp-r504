FROM debian:11

RUN apt-get update 

RUN apt-get upgrade -y

RUN apt-get install -y pkg-config

RUN apt-get install -y python3-venv

RUN apt-get install -y build-essential

RUN apt-get install -y python-dev

RUN apt-get install -y python3-pip

RUN apt-get install -y default-libmysqlclient-dev

RUN pip3 install --upgrade pip

RUN pip3 install flask-mysqldb 
RUN pip3 install mysql-connector-python

RUN mkdir -p /srv/templates

COPY nouvel_utilisateur.html /srv/templates/
COPY app1.py /srv/

CMD ["flask", "--app", "/srv/app1", "run", "--host=0.0.0.0"]
