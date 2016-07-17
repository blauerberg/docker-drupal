# docker-drupal

Drupal docker image without a DB.
This image is designed to be used with the [official mysql image](https://hub.docker.com/_/mysql) and include below:
  - apache2
  - drupal
  - drush
  - drupal console

Usage:
```
# run mysql
$ docker run -d --name drupaldb \
  -e MYSQL_ROOT_PASSWORD={root_pass} \
  -e MYSQL_DATABASE={drupal_dbname} \
  -e MYSQL_USER={drupal_username} \
  -e MYSQL_PASSWORD={drupals_password} \
  mysql

# run drupal 7
$ docker run -d -p 80:80 --link drupaldb:mysql blauerberg/drupal:7

# Or run drupal 8
$ docker run -d -p 80:80 --link drupaldb:mysql blauerberg/drupal:8

# if you want to mount host directory as drupal root, you can use "-v" option:
$ docker run -d -p 80:80 --link drupaldb:mysql -v /some/host/path:/var/www/html blauerberg/drupal

# you can also use docker-compose to configure your services.
$ curl https://raw.githubusercontent.com/blauerberg/docker-drupal/master/example.docker-compose.yml -o docker-compose.yml
$ docker-compose up -d
```

## License

MIT
