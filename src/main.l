%{

#include "y.tab.h"
#include <stdlib.h>

void yyerror(char *);

%}

%%

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

[0-9]+[\.]*[0-9]* {
  return INT;
}

["][^"]+["] {
  return STR;
}

[[:space:]]+ {}

[\n] {}

. {}

%%

int yywrap() {
  return 1;
}
