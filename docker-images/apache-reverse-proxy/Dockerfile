# use official PHP image
FROM php:5.6-apache

# copy apache configuration files
COPY conf/ /etc/apache2
#COPY apache2-foreground /usr/local/bin/
#COPY templates /var/apache2/templates

# enable proxy modules
RUN a2enmod proxy proxy_http

# enable sites
RUN a2ensite 000-* 001-*
