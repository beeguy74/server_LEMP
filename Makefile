# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tphung <tphung@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/25 14:14:43 by tphung            #+#    #+#              #
#    Updated: 2021/04/25 14:41:17 by tphung           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: build run

build:
	docker build -t lemp_image:latest .

run:
	docker run --name 42container -it --rm lemp_image:latest