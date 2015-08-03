docker-apache2-php-postgresql
=============================

Docker image to PHP and PostgreSQL standard projects.

**This is a customized version of brunoric DockerFile**

How to get?
-----------

Clone this git and navigate to this folder and run

	docker build -t zenyai/webserver .


How to use?
-----------

Start the container with the below command (Don't forget to change /path/of/your/app to your files)

	docker run -d -t -p 80:80 -p 5432:5432 -v /path/of/your/app:/app zenyai/webserver

Some options that can be changed at the container's startup:

- Enable Apache AllowOverride (to use .htaccess files) with `-e OVERRIDE=true`.
- Enable PHP short_open_tags with `-e SHORT_TAG=true`.
- Enable PHP display_errors with `-e ERRORS=true`.

Example of usage with these options:

	docker run -d -t -p 80:80 -p 5432:5432 -v /path/of/your/app:/app -e OVERRIDE=true -e SHORT_TAG=true -e ERRORS=true zenyai/webserver

To check what is the IP of your container just run the command below:

    docker inspect --format '{{ .NetworkSettings.IPAddress }}' <CONTAINER_ID>
    
##For vBitter

Make sure you have PHP & Composer install in your Mac, if not download Composer and run the following command

```
php -r "readfile('https://getcomposer.org/installer');" | php

php composer.phar install && php composer.phar update

``` 

What does this command?
-----------------------

- The `-p` parameters bind ports to the container, thereby `-p 80:80` and `-p 5432:5432` bind port 80 and 5432 of your
system to the exposed ports of Apache2 and PostgreSQL respectively.

- The `-v` parameter mount volumes of your system into the container. Change `/path/of/your/app` to the real path of the
application that you will run. The `/app` is the Apache2 root of this image, so when you mount your folder application
that will be accessible via `http://<CONTAINER_IP>`.

- The `-e` parameters sets values to the given enviroment variable.

Important notes
---------------

- Your application is accessible via `http://<CONTAINER_IP>` and your database `psql -h <CONTAINER_IP> -U postgres change@this*passw0rd`.
- Don't forget to change your `postgres` password with the query `ALTER USER postgres WITH PASSWORD '<NEW_PASSWORD>';` after connected to the database server.
- Docker documentation: [https://docs.docker.com][1]

Extra commands
-----------------------
To run under VPN connection do ```sysctl -w net.ipv4.ip_forward=1```, if doesn't work try setting the DNS ```docker run -dns 8.8.8.8 base ping google.com```


To connect bash to a running container 
```sudo docker exec -it <containerIdOrName> bash```

[1]: https://docs.docker.com
