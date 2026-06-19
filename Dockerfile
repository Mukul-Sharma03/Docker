FROM ubuntu:latest

# Maintainer information
LABEL dev="Mukul"

# Install Apache and unzip
RUN apt-get update && \
    apt-get install -y apache2 unzip && \
    rm -f /var/www/html/index.html

# Download website template
ADD https://templatemo.com/tm-621-luminary.zip /var/www/html/luminary.zip

# Switch to web root directory
WORKDIR /var/www/html

# Extract template and move files
RUN unzip luminary.zip && \
    mv templatemo_621_luminary/* . && \
    rm -rf templatemo_621_luminary luminary.zip

# Open HTTP port
EXPOSE 80

# Start Apache in foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]