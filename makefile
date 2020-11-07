CC=gcc
AR=ar
FLAGS= -Wall -g

all: mains maind

mains: main.o libmyMath.a
	$(CC) $(FLAGS) -o mains main.o libmyMath.a

maind: main.o libmyMath.so
	$(CC) $(FLAGS) -o maind main.o ./libmyMath.so

libmyMath.a: basicMath.o power.o
	$(AR) -rcs libmyMath.a basicMath.o power.o

libmyMath.so: basicMath.o power.o
	$(CC) -shared basicMath.o power.o -o libmyMath.so

mymaths: basicMath.o power.o
	$(AR) -rcs libmyMath.a basicMath.o power.o

mymathd: basicMath.o power.o
	$(CC) -shared basicMath.o power.o -o libmyMath.so

basicMath.o: basicMath.c myMath.h
	$(CC) $(FLAGS) -c basicMath.c

power.o: power.c myMath.h
	$(CC) $(FLAGS) -c power.c

main.o: main.c
	$(CC) $(FLAGS) -c main.c

.PHONY: clean
clean:
	rm -f mains maind *.o *.so *.a
