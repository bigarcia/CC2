programa : declaracoes 'algoritmo' corpo 'fim_algoritmo';

declaracoes : (decl_local_global)*;

decl_local_global : declaracao_local | declaracao_global;

declaracao_local : 'declare' variavel | 'constrante' IDENT ':' tipo_basico '=' valor_constante | 'tipo' IDENT ':' tipo;

variavel : identificador ( ',' identificador )* ':' tipo;

identificador: IDENT ('.' IDENT)* dimensao
dimensao : ('[' exp_aritmetica ']')*;

tipo : registro | tipo_estendido;

tipo_basico : 'literal' | 'inteiro' | 'real' | 'logico';

tipo_basico_ident : tipo_basico | IDENT;

tipo_estendido : ('^')? tipo_basico_ident;

valor_constante :  CADEIA | NUM_INT | NUM_REAL | 'verdadeiro' | 'falso';

registro : 'registro' (variavel)* 'fim_registro';

declaracao_global : 'procedimento' IDENT '(' (parametros)? ')' (declaracao_local)* (cmd)* 'fim_procedimento' | 'funcao' IDENT '(' (parametros)? ')' ':' tipo_estendido (declaracao_local)* (cmd)* 'fim_funcao';

parametro : ('var')? identificador (',' identificador)* ':' tipo_estendido;

parametros : parametro (',' parametro)*;

corpo: (declaracao_local)* (cmd)*;

cmd : cmdLeia | cmdEscreva | cmdSe | cmdCaso | cmdPara | cmdEnquanto | cmdFaca | cmdAtribuicao | cmdChamada | cmdRetorne;

cmdLeia : 'leia' '(' ('^')? identificador (',' ('^')? identificador)* ')';

cmdEscreva : 'escreva' '(' expressao (',' expressao)* ')';

cmdSe: 'se' expressao 'entao' (cmd)* (('senao' (cmd)*)? 'fim_se';

cmdCaso : 'caso' exp_aritmetica 'seja' selecao ('senao' (cmd)*)? 'fim_caso';

cmdPara : 'para' IDENT '<-' exp_aritmetica 'ate' exp_aritmetica 'faca' (cmd)* 'fim_para';

cmdEnquanto : 'enquanto' expressao 'faca' (cmd)* 'fim_enquanto';

cmdFaca : 'faca' (cmd)* 'ate' expressao;

cmdAtribuicao: ('^')? identificador '<-' expressao;

cmdChamada : IDENT '(' expressao (',' expressao)* ')';

cmdRetorne : 'retorne' expressao;

selecao: (item_selecao)*;

item_selecao : constantes ':' (cmd)*;

constantes: numero_intervalo (',' numero_intervalo)*;

numero_intervalo : (op_unario)? NUM_INT ('..' (op_unario)? NUM_INT)?;

op_unario : '-';

exp_aritmetica : termo (op1 termo)*;

termo: fator (op2 fator)*;

fator: parcela (op3 parcela)*;

op1: '+' | '-';
op2: '*' | '/';
op3: '%';

parcela : (op_unario)? parcela_unario | parcela_nao_unario;

parcela_unario: ('^')? identificador | IDENT '(' expressao (',' expressao)* ')' | NUM_INT | NUM_REAL | '(' expressao ')';

parcela_nao_unario : '&' identificador | CADEIA;

op_relacional : '=' | '<>' | '>=' | '<=' | '>' | '<';

expressao : termo_logico (op_logico_1 termo_logico)*;

termo_logico: fator_logico (op_logico_2 fator_logico)*;

fator_logico : ('nao')? parcela_logica;

parcela_logica : ( 'verdadeiro' | 'falso' ) | exp_relacional;

op_logico_1 : 'ou';

op_logico_2 :'e';


