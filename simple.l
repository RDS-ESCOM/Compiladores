%{
#include <string.h>
#include "util.h"
#include "tokens.h"
#include "errormsg.h"

int charPos=1;

extern YYSTYPE yylval;

int yywrap(void)
{
 charPos=1;
 return 1;
}


void adjust(void)
{
 EM_tokPos=charPos;
 charPos+=yyleng;
}

char bufer[256];char *apbufer;

%}
%x cade
%%
" "      {adjust(); continue;}
\n       {adjust(); EM_newline(); continue;}
","      {adjust(); return ',';}
";"      {adjust(); return ';';}
"="      {adjust(); return '=';}
"("      {adjust(); return '(';}
")"      {adjust(); return ')';}
"+"      {adjust(); return '+';}
"-"      {adjust(); return '-';}
"*"      {adjust(); return '*';}
"/"      {adjust(); return '/';}
despliega  {adjust(); return DESPLIEGA;}
[0-9]+   {adjust(); yylval.ival=atoi(yytext); return INT;}

 /*<<EOF>> {printf("\nFin de Archivo encontrado."); exit(0); }*/

.        {adjust(); EM_error(EM_tokPos,"token ilegal");}
