module mux_4_1(i_0,i_1,i_2,i_3,s_0,s_1,y);
input i_0,i_1,i_2,i_3,s_0,s_1;
output y;

assign y= (~s_1 & ~s_0 & i_0) | (~s_1 & s_0 & i_1) | (s_1 & ~s_0 & i_2) | (s_1 & s_0 & i_3);

endmodule


//test bench
`timescale 1ns/1ns
module mux_4_1_tb;
reg i_0,i_1,i_2,i_3,s_0,s_1; //DUT input
wire y;  //DUT output 

integer i;
mux_4_1 f(i_0,i_1,i_2,i_3,s_0,s_1,y);

initial begin
	for(i =0; i<63 ; i=i+1)
	#10 {i_0,i_1,i_2,i_3,s_0,s_1}=i;
end

//system task
initial
$monitor ("T=%0t\n s_0=%b s_1=%b i_0=%b i_1=%b i_2=%b i_3=%b y=%b", $realtime,s_0,s_1,i_0,i_1,i_2,i_3,y);

endmodule
