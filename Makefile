NAME		= minishell

GREEN		= \033[0;32m
GREY		= \033[0;90m
YELLOW		= \033[1;33m
FRED		= \033[41;1;37m
RED			= \033[0;31m
RESET		= \033[0m


OBJ_DIR = ./objects

SRCS_PATH	= ./sources

CC 			= gcc -g3

FLAGS 		= -Wall -Wextra -Werror

REMOVE 		= rm -f

INCLUDES 	= -I ./includes/

LIBFT_D		= ./libft
LIBFT_I		= -I$(LIBFT_D)
LIBFT_L		= -L$(LIBFT_D) -lft
LIBFT_A		= $(LIBFT_D)/libft.a

SRCS 		=	$(SRCS_PATH)/minishell.c	\

OBJS		= $(addprefix $(OBJ_DIR)/,$(SRCS:.c=.o))


all:		$(NAME)

$(NAME): $(OBJS) $(LIBFT_A)
	@printf "$(YELLOW)compiling $(NAME) ... $(RESET)"
	@$(CC) $(FLAGS) $(INCLUDES) $(LIBFT_I) $(OBJS) $(LIBFT_L) -o $(NAME)
	@echo "$(GREEN)Done!!$(RESET)"

$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	@$(CC) $(FLAGS) $(INCLUDES) $(LIBFT_I) -c $< -o $@

$(LIBFT_A):
	@echo "$(YELLOW)Compiling libft ... \t\c$(RESET)"
	@$(MAKE) -s -C $(LIBFT_D)
	@echo "$(GREEN)Done!!$(RESET)"


clean:
	@${REMOVE} ${NAME}
	@echo "$(RED)\t\t\t\n\n$(NAME): $(NAME) was deleted\t\t\t\n\n$(RESET)"


fclean:
	@make -s fclean -C $(LIBFT_D)/
	@printf "$(RED)cleaning $(NAME) executable ... \n$(RESET)"
	@$(REMOVE) $(NAME)
	@$(REMOVE)  -r $(OBJ_DIR)
	@echo "$(RED)\t\t\t\n$(NAME): $(NAME) was deleted ...$(RESET)\n"

re:			clean $(NAME)

val:
	@valgrind --leak-check=full --show-leak-kinds=all --quiet --tool=memcheck --keep-debuginfo=yes 

.PHONY:		all clean fclean re run3 run5 run7 run-sorted-1 run-sorted-2 run-sorted-3 run80 run100 run500 val