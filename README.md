# Sample code to generate parser using bison and flex.

A parser have two stages, a lexical analyser and a parser. the lexer/lexical
analyer tokenize the input texts. Lexer pass through input stream and produce
token for parser. Parser, the next stage process these token and perform
actions as suggested in the grammer.

simApp.l  :- Grammer to specify lexer
simApp.y  :- Grammer for the parser.
correct.txt, wrong.txt :- input files to validate generated parser.


We use flex and bison to generate the lexer and parser for the grammer.

