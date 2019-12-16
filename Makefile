# Variables

OUT_DIR := output/
OUT_O_DIR := obj/
PROJ = hello
CFLAGS = -I include
CC = g++
SOURCE = $(wildcard src/*.cpp)
INC = $(wildcard include/*.h)

# convert .cpp to .o and place in obj dir
OBJS = $(SOURCE:src/%.cpp=$(OUT_O_DIR)%.o) 

.PHONY: directories

all :	directories $(OUT_DIR)$(PROJ)

directories:	$(OUT_DIR) $(OUT_O_DIR)

# Rules

$(OUT_DIR)$(PROJ) :	$(OBJS)
	$(CC) -o $@ $(OBJS)

# for any object file, look for corresponding cpp
${OUT_O_DIR}%.o: src/%.cpp $(INC)
	$(CC) -c $(CFLAGS) $< -o $@	

clean :
	rm -rf $(OUT_DIR)
	rm -rf $(OUT_O_DIR)

$(OUT_DIR) :	
	mkdir -p $(OUT_DIR)

$(OUT_O_DIR) :
	mkdir -p $(OUT_O_DIR)
