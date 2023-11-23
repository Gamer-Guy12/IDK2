NAME:=IDK
CC:=gcc
CFLAGS:=-c -Isrc/include -Iinclude
LIBS=-l:libcglm.so.0.9.2 -lGL -lglfw3 -lX11 -lpthread -lXrandr -lXi -ldl
LIBPATH=-Llibs
LD:=gcc
LDFLAGS= -o bin/$(NAME) 
SOURCES=$(wildcard src/*.c)
OBJS:=$(patsubst src/%.c, bin/int/%.o, $(SOURCES))

.PHONY: clean build run

build: $(OBJS)
	$(LD) $(LDFLAGS) $(LIBPATH) $(LIBS) $(OBJS)

bin/int/%.o: src/%.c
	$(CC) $(CFLAGS) $< -o bin/int/$*.o

clean:
	rm -r bin
	mkdir -p bin/int
	
run:
	./bin/$(NAME)
