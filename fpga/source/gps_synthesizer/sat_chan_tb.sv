`timescale 1 ns / 1 ps

module sat_chan_tb ();

    logic        enable;
    logic[31:0]  freq;
    logic[15:0]  gain;    
    logic[5:0]   ca_sel;
    logic[35:0]  ca_seq;
    logic[15:0]  real_out;
    logic[15:0]  imag_out;

    localparam clk_period = 10;
    logic clk = 0;
    always #(clk_period/2) clk = ~clk;
    
    sat_chan uut(.*);
  
    initial begin
        freq = 32'h01234567;
        enable = 0;
        #(clk_period*10);
        enable = 1;
        #(clk_period*1000);
        freq = 32'h02468ace;
     end

endmodule
