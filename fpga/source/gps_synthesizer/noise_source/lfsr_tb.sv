module lfsr_tb ();

    localparam WIDTH = 8;
    logic [WIDTH-1:0] datain, dataout;
    logic reset;

    localparam clk_period = 10;
    logic clk = 0;
    always #(clk_period/2) clk = ~clk;
    
    lfsr #(.WIDTH(WIDTH)) lfsr_inst (.datain(datain), .dataout(dataout));

    initial begin
        reset = 1;
        #(clk_period*10);
        reset = 0;
    end

    always_ff @(posedge clk) begin
        if (reset == 1) begin
            datain <= 1;
        end else begin
            datain <= dataout;
        end
    end

endmodule

