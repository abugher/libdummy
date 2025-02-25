all: libdummy.so

libdummy.so: libdummy.o
	gcc -shared -o libdummy.so libdummy.o

libdummy.o:
	gcc -c -Wall -Werror -fpic libdummy.c

clean:
	rm libdummy.so
	rm libdummy.o
