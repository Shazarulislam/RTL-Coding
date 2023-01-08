module bcd_adder_d(a,b,carry,sum);
input [3:0]a,b;
output [8:0] sum;
output carry;

wire [8:0] sum_b;

assign sum_b= a+b;

assign {carry,sum}= ((sum_b <= 4'b101) ? {1'b0 , sum_b}: (sum_b + 4'b0110));
endmodule

//test bench//
`timescale 1ns / 1ns
module bcd_adder_tb; 

reg [3:0] a,b;  //dut input
wire [8:0] sum;  //dut output 

integer i;

bcd_adder_d f(a,b,carry,sum); //module instantiation

initial begin
  for (i=0; i <= 511 ; i = i+1)
    #10 {a,b} = i;
end

//system task
initial
$monitor ("Time T=%0t a=%d b=%d | sum = %b carry =%b", $realtime, a,b,sum,carry);

endmodule

