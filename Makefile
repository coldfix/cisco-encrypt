CC 		= gcc
CFLAGS 	= -O3
LFLAGS  = -lgcrypt

all: cisco-encrypt
install:
	cp cisco-encrypt /usr/local/bin/

%: %.c
	$(CC) -o $@ $< $(CFLAGS) $(LFLAGS)
