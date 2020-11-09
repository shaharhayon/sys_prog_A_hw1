CC=gcc
AR=ar
FLAGS= -Wall -g

all: mains maind

mains: main.o libmyMath.a
	$(CC) $(FLAGS) -o mains main.o -L. -lmyMath
	
libmyMath.a: basicMaths.o powers.o
	$(AR) -rcs libmyMath.a basicMaths.o powers.o

mymaths: basicMaths.o power.o
	$(AR) -rcs libmyMath.a basicMaths.o powers.o
	
basicMaths.o: basicMath.c myMath.h
	$(CC) $(FLAGS) -c -o basicMaths.o basicMath.c 

powers.o: power.c myMath.h
	$(CC) $(FLAGS) -c -o powers.o power.c
	
	
maind: main.o libmyMath.so
	$(CC) $(FLAGS) -o maind main.o ./libmyMath.so

libmyMath.so: basicMathd.o powerd.o
	$(CC) -shared basicMathd.o powerd.o -o libmyMath.so

mymathd: basicMathd.o powerd.o
	$(CC) -shared basicMathd.o powerd.o -o libmyMath.so

basicMathd.o: basicMath.c myMath.h
	$(CC) $(FLAGS) -c -fPIC basicMath.c -o basicMathd.o

powerd.o: power.c myMath.h
	$(CC) $(FLAGS) -c -fPIC power.c -o powerd.o
	

main.o: main.c
	$(CC) $(FLAGS) -c main.c

.PHONY: clean
clean:
	rm -f mains maind *.o *.so *.a
