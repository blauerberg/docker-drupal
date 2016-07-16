#!/bin/bash
set -e

if [ ! -e "/var/www/html/index.php" ]; then
  tar zxf /usr/local/src/drupal-${DRUPAL_VERSION}.tar.gz --strip-components=1
  chown -R www-data:www-data /var/www/html/sites
fi

/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
