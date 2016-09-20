FROM php:7.0-apache
MAINTAINER Yoshikazu Aoyama <yskz.aoyama@gmail.com>

RUN a2enmod rewrite

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev \
	      && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	      && docker-php-ext-install gd mbstring pdo pdo_mysql zip \
        && apt-get autoclean \
        && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y mysql-client zsh tmux git rsync vim supervisor \
        && apt-get autoclean \
        && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php \
        && mv composer.phar /usr/local/bin/composer \
        && ln -s /usr/local/bin/composer /usr/bin/composer

RUN /usr/local/bin/composer global require "hirak/prestissimo"

RUN /usr/local/bin/composer global require "drush/drush:8.x" \
        && ln -s ~/.composer/vendor/bin/drush /usr/local/bin/drush \
        && /usr/local/bin/drush -y init

RUN /usr/local/bin/composer global require "drupal/console:1.0.0-beta5" \
        && ln -s ~/.composer/vendor/bin/drupal /usr/local/bin/drupal \
        && /usr/local/bin/drupal init --override -y

RUN echo "[program:apache2]" > /etc/supervisor/conf.d/apache2.conf \
        && echo 'command=/bin/bash -c "source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND"' >> /etc/supervisor/conf.d/apache2.conf

RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor

ENV DRUPAL_VERSION 7.50
RUN curl "https://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz" -o /usr/local/src/drupal-${DRUPAL_VERSION}.tar.gz

EXPOSE 80
VOLUME /var/www/html
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
