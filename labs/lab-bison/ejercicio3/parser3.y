%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int  yylex(void);
void yyerror(const char *msg) { fprintf(stderr, "Error: %s\n", msg); }
%}

%token NUM
%token POW
%token UMINUS   /* token ficticio para el menos unario — ya declarado, no hay que tocarlo */

/* Precedencia y asociatividad de menor a mayor */
%left '+' '-'        /* TODO 1 */
%left '*' '/'        /* TODO 2 */
%right POW           /* TODO 3 */
%right UMINUS        /* TODO 4 */

%%

input:
    /* vacío */
  | input linea
  ;

linea:
    exp '\n'   { printf("= %d\n", $1); }
  ;

exp:
    exp '+' exp           { $$ = $1 + $3; }
  | exp '-' exp           { $$ = $1 - $3; }
  | exp '*' exp           { $$ = $1 * $3; }
  | exp '/' exp           { $$ = $1 / $3; }
  | exp POW exp           { $$ = (int)pow($1, $3); }
  | '-' exp %prec UMINUS  { $$ = -$2; } /* TODO 5 */
  | '(' exp ')'           { $$ = $2; }
  | NUM                   { $$ = $1; }
  ;

%%

int main(void) {
    return yyparse();
}
