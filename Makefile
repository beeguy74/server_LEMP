# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tphung <tphung@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/25 14:14:43 by tphung            #+#    #+#              #
#    Updated: 2021/04/26 14:36:13 by tphung           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: build run

build:
	docker build -t lemp_image:latest .

run:
	docker run -it --name 42container -p 80:80 --rm lemp_image:latest