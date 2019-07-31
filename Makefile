default:
	clear
	flex -l simApp.l
	bison -tdv simApp.y 
	gcc -o simAppParse simApp.tab.c lex.yy.c -lfl
