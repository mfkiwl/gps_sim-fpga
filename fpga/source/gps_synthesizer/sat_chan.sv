module sat_chan (
    input  logic        clk,
    input  logic        enable,
    input  logic[31:0]  freq,
    input  logic[15:0]  gain,
    output logic[15:0]  real_out,
    output logic[15:0]  imag_out
);

    logic [8:0] nco_real, nco_imag;    
    logic [15:0] scaled_nco_real, scaled_nco_imag;
    doppler_nco doppler_nco_inst ( .clk(clk), .enable(enable), .freq(freq), .real_out(nco_real), .imag_out(nco_imag) );

    // we need to scale the imaginary part of the NCO output by 1/sqrt(2) ~ 0.7
    localparam int p_scale = (2.0**16)/$sqrt(2.0);
    always_ff @(posedge clk) begin
        scaled_nco_real <= {nco_real, 7'b0000000};
        scaled_nco_imag <= p_scale; 
        
    end


endmodule
