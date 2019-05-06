EXECUTABLES = sheesh

INCLUDES = sheesh.h

# Do all C compies with gcc (at home you could try clang)
CC = gcc

CFLAGS =  -g -std=c99 -Wall -Wextra -Werror -Wfatal-errors -pedantic $(IFLAGS)
LIBS = $(CIILIBS)
LFLAGS = 

# Linking flags, used in the linking step
# Set debugging information and update linking path
# to include course binaries and CII implementations
LDFLAGS = -g 

# Libraries needed for any of the programs that will be linked
# Both programs need cii40 (Hanson binaries) and *may* need -lm (math)
# Only brightness requires the binary for pnmrdr.
LDLIBS = -lncurses


# 
#    'make all' will build all executables
#
#    Note that "all" is the default target that make will build
#    if nothing is specifically requested
#
all: $(EXECUTABLES)

# 
#    'make clean' will remove all object and executable files
#
clean:
	rm -f $(EXECUTABLES) *.o


# 
#    To get any .o, compile the corresponding .c
#
%.o:%.c $(INCLUDES) 
	$(CC) $(CFLAGS) -c $<

sheesh: sheesh.o
	$(CC) $(LDFLAGS) -o sheesh sheesh.o $(LDLIBS)
