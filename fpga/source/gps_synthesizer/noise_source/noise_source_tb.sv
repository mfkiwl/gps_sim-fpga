module noise_source_tb ();

    logic            clk;
    logic            reset;
    logic [15:0]     real_out, imag_out;

    localparam clk_period = 10;
    logic clk = 0;
    always #(clk_period/2) clk = ~clk;
    
    noise_source uut (.*);

    initial begin
        reset = 1;
        #(clk_period*10);
        reset = 0;
    end

endmodule

