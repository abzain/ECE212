module mux (
		 input logic  solid_clk, oneHz, twoHz,
		 input logic [1:0]    sel,
		 output logic blink
		 );

    parameter BAUD = 1;  // desired frequency in Hz 
    parameter TWICEBAUD = 2;
    
    //clkdiv 
    clkdiv #(.DIVFREQ(BAUD)) U_CD_oneHz(.clk(CLK100MHZ), .reset(BTNU), .sclk(oneHz_clk));
    clkdiv #(.DIVFREQ(TWICEBAUD)) U_CD_twoHz(.clk(CLK100MHZ), .reset(BTNU), .sclk(twoHz_clk));
   always_comb
     case (sel)
       2'd0 : blink = solid_clk;
       2'd1 : blink = oneHz;
       2'd2 : blink = twoHz;
       default : blink = '0;  // fills all bits with 0s
     endcase // case(sel)
endmodule // 

