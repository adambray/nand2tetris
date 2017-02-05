load Decode.hdl,
output-file Decode.out,
output-list time%S1.4.1 instruction%B1.16.1 cType%B1.1.1 cAMSelect%B1.1.1 cALU%B1.6.1 cLoadA%B1.1.1 cLoadD%B1.1.1 cLoadM%B1.1.1 cJump%B1.3.1;

set instruction %B1110111000111000,
tick,
output;

tock,
output;

set instruction %B0110111000111000,
tick,
output;

tock,
output;
tick,
output;

tock,
output;
