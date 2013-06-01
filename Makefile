#
# Trivial Makefile
# Uses dlang as input
#
kataEight:	kataEight.d
		dmd kataEight.d

clean:
		-rm kataEight.o kataEight
