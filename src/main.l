%{

#include "y.tab.h"
#include <stdlib.h>

void yyerror(char *);

%}

%%

[\0] {
  return EOFILE;
}

[\[] {
  return '[';
}

[\]] {
  return ']';
}

[\{] {
  return '{';
}

[\}] {
  return '}';
}

[\:] {
  return ':';
}

[\,] {
  return ',';
}

[0-9]+ {
  return INT;
}

["].+["] {
  return STR;
}

[[:space:]]+ {}

[\n] {}

%%

int yywrap() {
  return 1;
}
