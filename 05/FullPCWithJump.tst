load FullPCWithJump.hdl,
output-file FullPCWithJump.out,
output-list time%S1.4.1 address%D1.10.1 zr%B1.1.1 ng%B1.1.1 instruction%B1.3.1 reset%B2.1.2 pc%D1.6.1;

set instruction 0,
set reset 0,
set zr 0,
set ng 0,
tick,
output;

tock,
output;

set instruction 1,
set ng 0,
set zr 0,
set address 55,
tick,
output;

tock,
output;
tick,
output;

tock,
output;


set instruction 2,
set zr 1,
set address 123,
tick,
output;

tock,
output;
tick,
output;

tock,
output;
