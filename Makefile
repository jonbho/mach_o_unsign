CC := gcc
ARCHS := -arch x86_64
CFLAGS := -c -std=c99 -O2 -pedantic -Wall -Wextra -Wno-deprecated-declarations $(ARCHS) -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
LD := gcc
LDFLAGS := $(ARCHS)

unsign: unsign.o endian.o
	$(LD) $(LDFLAGS) $^ -o $@

endian.o: endian.c endian.h
	$(CC) $(CFLAGS) $< -o $@

unsign.o: unsign.c endian.h
	$(CC) $(CFLAGS) $< -o $@
