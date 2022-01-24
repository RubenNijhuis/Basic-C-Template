# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: rubennijhuis <rubennijhuis@student.coda      +#+                      #
#                                                    +#+                       #
#    Created: 2022/01/24 19:46:54 by rubennijhui   #+#    #+#                  #
#    Updated: 2022/01/24 20:05:18 by rubennijhui   ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME := pipex
INCLUDE_DIR := ./include
SRC_DIR := ./src
BIN_DIR := ./bin
LIB_DIR := ./libs

SRCS := main.c test/get_path_to_binary.c

INCLUDES := $(INCLUDE_DIR)libft.a\

SRCS_PREFIX = $(addsuffix $(SRCS), $(dir $(SRC_DIR)/))
INCLUDES_PREFIX = $(addsuffix $(INCLUDE_DIR), $(dir $(INCLUDES)))

CC = gcc
CFLAGS = -Wall -Wextra -Werror
COMPILE = $(CC) $(CFLAGS)

TEST_COMMAND = 

$(NAME):$(OBJS) $(INCLUDE_DIR)/$(NAME).h
	$(COMPILE) $(SRCS_PREFIX) -L $(INCLUDE_DIR)/ -lft -o $(NAME)

run:
	$(BIN_DIR)/$(NAME) $(TEST_COMMAND)

all: libft $(NAME)

clean:
	rm -rf $(OBJS)
	echo "🧹 Removing object files"

fclean: clean
	rm -rf $(BIN_DIR)/$(NAME)
	echo "🧹 Removing $(NAME) executable"

re: fclean all

.PHONY: run all clean fclean re