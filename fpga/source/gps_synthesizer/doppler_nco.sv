// a dds with complex output to apply synthetic doppler.
module doppler_nco (
    input  logic        clk,
    input  logic        enable,
    input  logic[31:0]  freq,
    output logic[8:0]   real_out,
    output logic[8:0]   imag_out
);

    // Let's use 32 bit accummulators for the DDS.
    logic [31:0] phase;
    always_ff @(posedge clk) begin
        if (enable == 1) begin
            phase <= phase + freq;
        end else begin
            phase <= 0;
        end;
    end;

    logic [31:0] m_axis_data_tdata;
    doppler_rom doppler_rom_inst (.aclk(clk), .s_axis_phase_tvalid(1), .s_axis_phase_tdata({4'b0000, phase[31-:14]}), .m_axis_data_tvalid(), .m_axis_data_tdata(m_axis_data_tdata));
    assign imag_out = m_axis_data_tdata[16 +: 9];
    assign real_out = m_axis_data_tdata[ 0 +: 9];

endmodule
