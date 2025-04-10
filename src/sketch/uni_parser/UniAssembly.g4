grammar UniAssembly;

// === Parser rules ===

program
    : line (NEWLINE line)* EOF
    ;

line
    : instruction
    | label
    | directive
    ;

instruction
    : SYMBOL operands?
    ;

label
    : (LCURLY SYMBOL RCURLY)* DOT_SYMBOL COLON
    | SYMBOL COLON
    ;

directive
    : (LCURLY SYMBOL RCURLY)* DOT_SYMBOL operands?
    ;

// === Operand rules ===

operands
    : operand (COMMA operand)*
    ;

memory_operand
    : NUMBER LPAREN REGISTER RPAREN
    | LBRACK REGISTER COMMA relocation_expr RBRACK
    | LBRACK REGISTER RBRACK   
    | LBRACK REGISTER COMMA NUMBER RBRACK
    | LBRACK REGISTER COMMA NUMBER RBRACK BANG
    ;

modified_symbol
    : COLON SYMBOL COLON SYMBOL
    | COLON SYMBOL COLON DOT_SYMBOL
    ;

relocation_expr
    : HASH COLON SYMBOL COLON SYMBOL
    ;

expression
    : DOT MINUS SYMBOL
    ;

operand
    : REGISTER
    | memory_operand
    | modified_symbol
    | expression
    | NUMBER
    | IMMEDIATE
    | SYMBOL
    | DOT_SYMBOL
    | STRING
    ;

REGISTER: 'x' [0-9]+ | 'r' [0-9]+ | 'a' [0-9]+ | 's' [0-9]+ | 'sp';

SYMBOL: [a-zA-Z_@%][a-zA-Z0-9_@.-]*;

DOT_SYMBOL: '.'? [a-zA-Z_][a-zA-Z0-9_@.-]*;

IMMEDIATE: '#' [0-9]+;
NUMBER: '-'? [0-9]+;

STRING: '"' (~["\r\n] | '\\' .)* '"';

COLON: ':';
COMMA: ',';

LPAREN: '(';
RPAREN: ')';

LBRACK: '[';
RBRACK: ']';
HASH: '#';

BANG: '!';

DOT: '.';
MINUS: '-';

LCURLY: '{';
RCURLY: '}';

NEWLINE: '\r'? '\n';
WS: [ \t]+ -> skip;
