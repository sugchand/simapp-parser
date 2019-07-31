%{

#include <stdio.h>
#include <string.h>
#include "simApp.tab.h"
void showError();
%}


numbers     ([0-9])+
alpha       ([a-zA-Z_])+


%%

{alpha}         {
                      if (!strncmp(yytext, "app", sizeof("app"))) {
                          return (APP);
                      }
                      sscanf(yytext, "%s", yylval.name); return (STRING);
                }
{numbers}       {yylval.number = atoi(yytext); return (NUM);}
"="             {return (EQUALS);}
"{"             {return (BEGIN_BRACE);}
"}"             {return (END_BRACE);}
" "             {return (SPACE);}
","             {return (COMMA);}
.               {showError(); return(OTHER);}

%%


void showError(){
    printf("Wrong input");
}
