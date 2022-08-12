##
##EPITECH PROJECT, 2022
## minilibc
## File description:
## makefile
##

CC	=	gcc

LD	=	ld

NASM	=	nasm

SRC =	src/strlen.asm \
		src/strchr.asm \
		src/strrchr.asm \
		src/memset.asm \
		src/memcpy.asm \
		src/strcmp.asm \
		src/memmove.asm \
		src/strncmp.asm \
		src/strcasecmp.asm \
		src/strstr.asm \
		src/strpbrk.asm \
		src/strcspn.asm \
		src/ffs.asm \
		src/memfrob.asm \
		src/strfry.asm \

SRCTEST =	tests/test_strlen.c \
			tests/test_strchr.c \
			tests/test_strrchr.c \
			tests/test_memset.c \
			tests/test_memcpy.c \
			tests/test_strcmp.c \
			tests/test_memmove.c \
			tests/test_strncmp.c \
			tests/test_strcasecmp.c \
			tests/test_strstr.c \
			tests/test_strpbrk.c \
			tests/test_strcspn.c \
			tests/test_ffs.c \
			tests/test_index.c \
			tests/test_rindex.c \
			tests/test_memfrob.c \
			tests/test_strfry.c \

OBJS	=	$(SRC:.asm=.o)

LDFLAGS	=	-shared

ASMFLAGS	= 	-f elf64

NAME	=	libasm.so

NAMETEST = test

all: $(NAME)

$(NAME): $(OBJS)
	$(LD) -o $(NAME) $(OBJS) $(LDFLAGS)

%.o: %.asm
	$(NASM) $(ASMFLAGS) -o $@ $<

tests_run: fclean $(NAME)
	$(CC) -o $(NAMETEST) $(SRCTEST) --coverage -lcriterion -ldl
	./$(NAMETEST)

clean:
	$(RM) $(OBJS)

fclean:	clean
	$(RM) *.gcda *.gcno
	$(RM) $(NAME)
	$(RM) $(NAMETEST)

re:	fclean all
