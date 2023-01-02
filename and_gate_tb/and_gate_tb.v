module and_gate(a,b,y);
input a,b;
output y;
and (y,a,b);
endmodule

//Test bench of and gate
module And_gate_tb;
reg a,b;  // here the DUT input
wire y;  // here the DUT output

integer i;

and_gate f(a,b,y);   //DUT module instantiation

//input test vectors

initial begin
	for ( i=0; i < 3; i=i+1)
		#10 {a,b}=i;
end

//system task

initial
 $monitor("At the time of T=%0t, The value of a=%b\n The value of b=%b\n The value of y=%b", $realtime,a,b,y);

endmodule
 
