FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y tcl
RUN apt-get install -y apache2 mariadb-server php php-mysql libapache2-mod-php php-xml php-mbstring
RUN apt-get install -y  php-apcu php-intl imagemagick inkscape php-gd php-cli php-curl php-bcmath git
RUN apt-get install -y wget vim
RUN cd /tmp/ && wget https://releases.wikimedia.org/mediawiki/1.38/mediawiki-1.38.2.tar.gz
RUN tar -xvzf /tmp/mediawiki-*.tar.gz && \
    mkdir /var/lib/mediawiki && \
    mv mediawiki-*/* /var/lib/mediawiki
EXPOSE 8080 80 22 81 82
CMD ["apache2ctl", "-D", "FOREGROUND"]