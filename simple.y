%{
/* simple.y: Contiene los inicios de una especificacion para usarse en bison*/

#include <stdio.h>
#include "util.h"
#include "errormsg.h"
#include "tokens.h"


int yylex(void); /* C necesita conocer el prototipo de la función de  */
		 /* Análisis Léxico                                    */

void yyerror(char *s)
{
  EM_error(EM_tokPos, "%s", s);
}
%}

%token  INT
%token  DESPLIEGA

%union{
  int ival;
  char *sval;
};
        
%start program

/* A continuación la gramática */
                                 
%%

program: sent

sent: DESPLIEGA '(' exp ')'
    ;

exp: INT
   ;

