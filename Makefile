# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tphung <tphung@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/25 14:14:43 by tphung            #+#    #+#              #
#    Updated: 2021/04/26 16:37:36 by tphung           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: build run

build:
	docker build -t lemp_image:latest .

run:
	docker run --name 42container -it -p 80:80 -p 443:443 --rm lemp_image:latest