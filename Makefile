# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tphung <tphung@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/25 14:14:43 by tphung            #+#    #+#              #
#    Updated: 2024/04/01 18:09:59 by tphung           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: build run

build:
	docker volume create mysql-data
	docker build -t lemp_image:latest .

run:
	docker run --name 42container -v mysql-data:/var/lib/mysql -it -p 80:80 -p 443:443 --rm lemp_image:latest

stop:
	docker rm -f 42container

rm:
	docker volume remove mysql-data
