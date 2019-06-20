`timescale 1 ns / 1 ps

module doppler_nco_tb();

    logic        enable;
    logic[31:0]  freq;
    logic[8:0]   real_out, imag_out;


    localparam clk_period = 10;
    logic clk = 0;
    always #(clk_period/2) clk = ~clk;
    
    doppler_nco uut(.*);
  
    initial begin
        freq = 32'h01234567;
        enable = 0;
        #(clk_period*10);
        enable = 1;
        #(clk_period*1000);
        freq = 32'h02468ace;
     end

endmodule
