// A pseudo-random, pseudo-gaussian noise source.
// A signal that looks gaussian is created by summing four pn sequences.
module noise_source (
    input  logic            clk,
    input  logic            reset,
    output logic [15:0]     real_out, imag_out
);

    // These are the lfsr. Four are for the real and four for the imaginary.
    //Each is a different length to make them more independent.
    logic [31:0] d_real0, q_real0;
    logic [29:0] d_real1, q_real1;
    logic [27:0] d_real2, q_real2;
    logic [25:0] d_real3, q_real3;
    lfsr #(.WIDTH(32)) real_lfsr0 (.datain(d_real0), .dataout(q_real0));
    lfsr #(.WIDTH(30)) real_lfsr1 (.datain(d_real1), .dataout(q_real1));
    lfsr #(.WIDTH(28)) real_lfsr2 (.datain(d_real2), .dataout(q_real2));
    lfsr #(.WIDTH(26)) real_lfsr3 (.datain(d_real3), .dataout(q_real3));
    logic [30:0] d_imag0, q_imag0;
    logic [28:0] d_imag1, q_imag1;
    logic [26:0] d_imag2, q_imag2;
    logic [24:0] d_imag3, q_imag3;
    lfsr #(.WIDTH(32)) imag_lfsr0 (.datain(d_imag0), .dataout(q_imag0));
    lfsr #(.WIDTH(30)) imag_lfsr1 (.datain(d_imag1), .dataout(q_imag1));
    lfsr #(.WIDTH(28)) imag_lfsr2 (.datain(d_imag2), .dataout(q_imag2));
    lfsr #(.WIDTH(26)) imag_lfsr3 (.datain(d_imag3), .dataout(q_imag3));

    always_ff @(posedge clk) begin
        if (1 == reset) begin
            d_real0 <= 1;  d_real1 <= 1;  d_real2 <= 1;  d_real3 <= 1;
            d_imag0 <= 1;  d_imag1 <= 1;  d_imag2 <= 1;  d_imag3 <= 1;
        end else begin
            d_real0 <= q_real0; d_real1 <= q_real1; d_real2 <= q_real2; d_real3 <= q_real3;
            d_imag0 <= q_imag0; d_imag1 <= q_imag1; d_imag2 <= q_imag2; d_imag3 <= q_imag3;
        end
    end

    // here we sum 14 bits from each lfsr to make the 16 bit outputs.
    always_ff @(posedge clk) begin
        real_out <= d_real0[13:0] + d_real1[13:0] + d_real2[13:0] + d_real3[13:0];
        imag_out <= d_imag0[13:0] + d_imag1[13:0] + d_imag2[13:0] + d_imag3[13:0];
    end

endmodule

