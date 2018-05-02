#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "util.h"
#include "errormsg.h"

extern int yyparse(void);

void parse(string fname) 
{EM_reset(fname);
 if (yyparse() == 0){ /* Funcionó el análisis sintáctico correctamente */
   fprintf(stderr,"Programa Simple sintácticamente correcto!\n");
 }
 else fprintf(stderr,"Programa Simple con errores\n");
}

int main(int argc, char **argv) {
 if (argc!=2) {fprintf(stderr,"uso %s archivo\n",argv[0]); exit(1);}
 parse(argv[1]);
 return 0;
}
