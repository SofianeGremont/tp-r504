FROM ubuntu:22.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install npm
RUN npm install -g @dbml/cli
RUN npm install -g @softwaretechnik/dbml-renderer
RUN apt-get -y install imagemagick
RUN nodejs --version
