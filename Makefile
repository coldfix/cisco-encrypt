CC     = gcc
CFLAGS = $(shell libgcrypt-config --cflags) -O3
LFLAGS = $(shell libgcrypt-config --libs)

all: cisco-encrypt
install:
	cp cisco-encrypt /usr/local/bin/

%: %.c
	$(CC) -o $@ $< $(CFLAGS) $(LFLAGS)

clean:
	rm -f cisco-encrypt
