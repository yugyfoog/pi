CFLAGS = -Wall -g
ASFLAGS = -g

all: ftest

ftest: ftest.o fast.o
	cc -g -o ftest ftest.o fast.o

ftest.o: fast.h

clean:
	rm -f *.o *~
