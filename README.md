# server_LEMP
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Docker_%28container_engine%29_logo.svg/1920px-Docker_%28container_engine%29_logo.svg.png"
     style="text-align:center" width=300px />

# Description
 This is a System Administration learning project. The goal is to create a web server with Nginx capable of running a WordPress website, phpMyAdmin, and a MySQL database. This server will run in only one Docker container, under Debian Buster. 
 
I have created a dynamic web server. It is packaged in a docker container.
The Docker image include:
Nginx
PHP
MariaDB SQL database
PhpMyAdmin
Wordpress

# How to

After starting the server, you can access WordPress at https://localhost/wordpress/
And phpMyAdmin at https://localhost/phpmyadmin/

## Project setup
You need Docker 3+ to run it.
After cloning the repository to build the container run:
```
make build
```
And to run the server:
```
make run
```
