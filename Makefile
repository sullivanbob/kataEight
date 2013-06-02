#
# Trivial Makefile
# Uses dlang as input
#
all:	kataEight kataOptOne

kataOptOne:	kataOptOne.d
		dmd kataOptOne.d

kataEight:	kataEight.d
		dmd kataEight.d

clean:
		-rm kataEight.o kataEight
		-rm kataOptOne.o kataOptOne
