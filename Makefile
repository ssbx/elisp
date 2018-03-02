.PHONY: run clean test
CFLAGS = -Wall

test: elisp
	cat test.lisp | ./elisp

elisp: lex.yy.o y.tab.o
	cc lex.yy.o y.tab.o -o elisp


lex.yy.c: scanner.l
	$(LEX) --header-file=lex.yy.h scanner.l
y.tab.c y.tab.h:
	$(YACC) -d parser.y


clean:
	$(RM) lex.yy.* y.tab.* elisp 


# cc -MM *.c
lex.yy.o: lex.yy.c y.tab.h
y.tab.o: y.tab.c lex.yy.h
