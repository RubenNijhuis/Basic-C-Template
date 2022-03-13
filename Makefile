# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: rnijhuis <rnijhuis@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2022/03/12 11:05:57 by rnijhuis      #+#    #+#                  #
#    Updated: 2022/03/13 16:48:06 by rubennijhui   ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#=====================================#
#========= General variables =========#
#=====================================#

NAME := example
INCLUDE_DIR := include
SRC_DIR := src
LIBS_DIR := libs
OBJS_DIR := objs
PROGRAM_LOCATION := $(BIN_DIR)/$(NAME)

#=====================================#
#============ Input files ============#
#=====================================#

LIBS := $(LIBS_DIR)/LibFT/libft.a \
		# $(LIBS_DIR)/Get-Next-Line/get-next-line.a \
		# $(LIBS_DIR)/PrintFT/printft.a \

LIBS_HEADERS := -I $(LIBS_DIR)/LibFT/include/ \
				# -I $(LIBS_DIR)/Get-Next-Line/include/ \
				# -I $(LIBS_DIR)/PrintFT/include/ \

INC := -I $(INCLUDE_DIR) $(LIBS_HEADERS)

SRCS := main.c

OBJS = $(addprefix $(OBJS_DIR)/,$(SRCS:.c=.o))

#=====================================#
#========= Command arguments =========#
#=====================================#

CC = gcc
CFLAGS = -Wall -Werror -Wextra -g $(INC)
LDFLAGS =

#=====================================#
#=============== Rules ===============#
#=====================================#

objs/%.o:src/%.c
	@mkdir -p $(dir $@)
	@$(CC) -c $(CFLAGS) -o $@ $^
	@echo "🔨 Compiling: $^"
	
all: $(NAME)

$(NAME):$(OBJS) $(LIBS)
	@$(CC) $(OBJS) $(LDFLAGS) $(LIBS) -o $(NAME)
	@echo "✅ Built $(NAME)"

$(LIBS_DIR)/LibFT/libft.a:
	@make -C $(LIBS_DIR)/LibFT

$(LIBS_DIR)/Get-Next-Line/get_next_line.a:
	@make -C $(LIBS_DIR)/Get-Next-Line

submodules:
	@git submodule update --init --recursive
	@cd $(LIBS_DIR)/LibFt/ && git pull
	@cd $(LIBS_DIR)/Get-Next-Line/ && git pull

run: $(NAME)
	./$(NAME)

clean:
	@make clean -C $(LIBS_DIR)/Get-Next-Line
	@rm -rf $(OBJS_DIR)

fclean: clean
	@make fclean -C $(LIBS_DIR)/Get-Next-Line
	@rm -f $(NAME)

re: fclean all

.PHONY: all re run clean fclean
