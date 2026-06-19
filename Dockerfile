FROM ubuntu:latest
#base image is added

LABEL dev="Mukul"
#giving tags to the docker 

RUN apt-get update && \
    apt-get install apache2 unzip -y && \
    rm -rf /var/www/html/index.html
# We installed webserver, unzip package and updated the base image

ADD https://templatemo.com/download/templatemo_621_luminary /var/www/html/templatemo_621_luminary.zip
#add will download the static page from internet and move it in /var/www/html location

WORKDIR /var/www/html
#Changing/Switching directories to /var/www/html

RUN unzip templatemo_621_luminary.zip && \
    mv templatemo_621_luminary/* /var/www/html/
#Unzip the directory and moved static code into the /var/www/html


EXPOSE 80
#Container will be having 80 port open

CMD ["apache2ctl", "-D", "FOREGROUND"]
#Command "CMD" is used to start the single running process on docker
