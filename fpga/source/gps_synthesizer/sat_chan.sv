module sat_chan (
    input  logic        clk,
    input  logic        enable,
    input  logic[31:0]  freq,
    input  logic[15:0]  gain,
    output logic[15:0]  real_out,
    output logic[15:0]  imag_out
);

    logic signed [8:0] nco_real, nco_imag;    
    logic [15:0] scaled_nco_real, scaled_nco_imag;
    doppler_nco doppler_nco_inst ( .clk(clk), .enable(enable), .freq(freq), .real_out(nco_real), .imag_out(nco_imag) );

    // we need to scale the imaginary part of the NCO output by 1/sqrt(2) ~ 0.7
    localparam int p_scale = (2.0**8)/$sqrt(2.0);                            // supposedly this automatically rounds from float to int.
    logic signed [2*9-1:0] imag_scale_var;
    assign imag_scale_var = p_scale*nco_imag;
    always_ff @(posedge clk) begin
        scaled_nco_real <= {{7{nco_real[8]}},        nco_real};              // not sign extension to 16 bits.
        scaled_nco_imag <= {{7{imag_scale_var[16]}}, imag_scale_var[16-:9]}; // we should round here instead of just truncating.
    end

endmodule
