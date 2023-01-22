
module counter (count, clk, reset);
output [7:0] count;
input clk, reset;

 function [7:0] increment;
 
   for (i = 4'b0; ((carry == 4'b1) && (i <= 7));  i = i+ 4'b1)
       begin
         increment[i] = val[i] ^ carry;
         carry = val[i] & carry;
       end
   
 endfunction

always @ (posedge clk or posedge reset)
  if (reset)
     count = #tpd_reset_to_count 8'h00;
  else
     count <= #tpd_clk_to_count increment(count);
endmodule
