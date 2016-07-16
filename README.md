# docker-drupal# 

Drupal docker image without a DB.
This image is designed to be used with the [official mysql image](https://hub.docker.com/_/mysql) and include below:
  - apache2
  - drupal
  - drush
  - drupal console

Usage:
```
$ docker run -d --name drupaldb \
  -e MYSQL_ROOT_PASSWORD={root_pass} \
  -e MYSQL_DATABASE={drupal_dbname} \
  -e MYSQL_USER={drupal_username} \
  -e MYSQL_PASSWORD={drupals_password} \
  mysql

$ docker run -d -p 80:80 --link drupaldb:mysql blauerberg/drupal
```

## License

MIT
