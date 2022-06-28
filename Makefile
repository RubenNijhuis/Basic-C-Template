# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: rubennijhuis <rubennijhuis@student.coda      +#+                      #
#                                                    +#+                       #
#    Created: 2022/04/24 20:14:42 by rubennijhui   #+#    #+#                  #
#    Updated: 2022/06/28 13:30:35 by rubennijhui   ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#=====================================#
#========= General variables =========#
#=====================================#

NAME := bin/example
ASSETS_DIR := assets
BIN_DIR := bin
INCLUDE_DIR := include
LIBS_DIR := libs
OBJS_DIR := objs
SRC_DIR := src
TEST_DIR := test

#=====================================#
#=============== Input ===============#
#=====================================#

LIBS := $(LIBS_DIR)/LibFT/libft.a \
		$(LIBS_DIR)/Get-Next-Line/get-next-line.a \

LIBS_HEADERS := -I $(INCLUDE_DIR) \
				-I $(LIBS_DIR)/LibFT/include/ \
				-I $(LIBS_DIR)/Get-Next-Line/include/ \

INC := $(LIBS_HEADERS)

SRCS := main.c \
		test.c \

OBJS = $(addprefix $(OBJS_DIR)/,$(SRCS:.c=.o))

#=====================================#
#========= Command arguments =========#
#=====================================#

CC = gcc
CFLAGS = -Wall -Werror -Wextra -g $(INC)
NO_DEAD_CODE := -O1 -Os -fdata-sections -ffunction-sections -Wl, -dead_strip

#=====================================#
#=============== Rules ===============#
#=====================================#

objs/%.o:src/%.c
	@mkdir -p $(dir $@)
	@$(CC) -c $(CFLAGS) -o $@ $^
	@echo "🔨 Compiling: $^"
	
all: $(NAME)

$(NAME):$(OBJS) $(LIBS)
	@$(CC) $(OBJS) $(LDFLAGS) $(LIBS) $(MLX) $(NO_DEAD_CODE) -o $(NAME)
	@echo "✅ Built $(NAME)"

clean:
	@rm -rf $(OBJS_DIR)

fclean: clean
	@make fclean -C $(LIBS_DIR)/LibFT
	@rm -f $(NAME)

re: fclean all

#=====================================#
#=========== Special Rules ===========#
#=====================================#

submodules:
	@git submodule update --init --recursive
	@cd $(LIBS_DIR)/LibFt/ && git pull origin main
	@cd $(LIBS_DIR)/Get-Next-Line/ && git pull origin main
	
run: $(NAME)
	@./$(NAME) $(INPUT_FILE)

test:
	@make run -C $(TEST_DIR)/

norm:
	@echo "\033[92m========= $(NAME) norm ========\033[0m"
	@-norminette $(INCLUDE_DIR)
	@-norminette $(SRC_DIR)
	@echo "\033[92m========= $(NAME) norm ========\033[0m"
	@echo
	@make norm -C $(LIBS_DIR)/LibFT

#=====================================#
#========== Lib compilation ==========#
#=====================================#

$(LIBS_DIR)/LibFT/libft.a:
	@make -C $(LIBS_DIR)/LibFT

$(LIBS_DIR)/Get-Next-Line/get-next-line.a:
	@make -C $(LIBS_DIR)/Get-Next-Line

#=====================================#
#================ Misc ===============#
#=====================================#

.PHONY: all re run clean fclean test
