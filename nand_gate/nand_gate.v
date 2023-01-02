module nand_gate(a,b,c);
input a,b;
output c;
assign c= ~(a & b);
endmodule

//test bench
`timescale 1ns/1ns
module nand_gate_tb;
reg a,b; //DUT input
wire c;   // DUT output

integer i;
nand_gate f(a,b,c); //DUT module instantiation

initial begin
	for (i=0 ; i<4; i=i+1)
		#10 {a,b}=i;
end

initial
$monitor("T=%0t\n a=%b\n b=%b\n c=%b\n",$realtime,a,b,c);

endmodule
