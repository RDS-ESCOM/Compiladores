parsetst: parsetst.o y.tab.o lex.yy.o errormsg.o util.o
	gcc -g -o parsetst parsetst.o y.tab.o lex.yy.o errormsg.o util.o

parsetst.o: parsetst.c tokens.h errormsg.h util.h
	gcc -g -c parsetst.c

errormsg.o: errormsg.c errormsg.h util.h
	gcc -g -c errormsg.c

lex.yy.o: lex.yy.c y.tab.h errormsg.h util.h
	gcc -g -c lex.yy.c

lex.yy.c: simple.l y.tab.h simple.y
	flex simple.l

y.tab.o: y.tab.c errormsg.h util.h
	gcc -g -c y.tab.c

y.tab.c: simple.y
	bison -dvy simple.y

util.o: util.c util.h
	cc -g -c util.c

clean: 
	rm -f lextest *.o y.output y.vcg
realclean: 
	rm -f a.out parsetst lextest *.o lex.yy.c y.tab.c y.tab.h\
	      y.output y.vcg *~
