
%{
#include <stdio.h>

int yylex();
int yyerror(char *s);

%}

%token APP STRING NUM EQUALS BEGIN_BRACE END_BRACE SPACE COMMA OTHER

%type <name> STRING
%type <number> NUM

%union{
    char name[20];
    int number;
}

%%

simApps:
  simApp
;

simApp:
      | APP spaces BEGIN_BRACE simAppProperties spaces END_BRACE

simAppProperties:
                |simAppProperties simAppProperty

simAppProperty:
              spaces STRING EQUALS NUM COMMA
              | spaces STRING EQUALS STRING COMMA
              | spaces STRING EQUALS STRING
              | spaces STRING EQUALS NUM
spaces:
       SPACE
       | spaces SPACE

;

%%

int yyerror(char *s)
{
    extern int yylineno;
	printf("Error on line : %d,  %s\n", yylineno, s);
	return 0;
}

int main(int argc, char *argv[])
{
    extern FILE *yyin;
/* Enable it to debug the parsing of tokens,
 * make sure bison command is provided with -t.
 * .output file provide insights on parser stages
 */
//#ifdef YYDEBUG
//      yydebug = 1;
//#endif

    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (yyin == NULL) {
            perror(argv[1]);
            return 1;
        }
    }
    else {
        printf("Reading the input from stdin\n");
    }
    if (!yyparse()) {
        printf("Successfully completed the token parsing\n");
    }
    return 0;
}
