//
module top (
    //
    output logic [14:0]DDR_addr,
    output logic [2:0]DDR_ba,
    output logic DDR_cas_n,
    output logic DDR_ck_n,
    output logic DDR_ck_p,
    output logic DDR_cke,
    output logic DDR_cs_n,
    output logic [3:0]DDR_dm,
    output logic [31:0]DDR_dq,
    output logic [3:0]DDR_dqs_n,
    output logic [3:0]DDR_dqs_p,
    output logic DDR_odt,
    output logic DDR_ras_n,
    output logic DDR_reset_n,
    output logic DDR_we_n,
    output logic FIXED_IO_ddr_vrn,
    output logic FIXED_IO_ddr_vrp,
    output logic [53:0]FIXED_IO_mio,
    input  logic FIXED_IO_ps_clk,
    input  logic FIXED_IO_ps_porb,
    input  logic FIXED_IO_ps_srstb
);

    logic [39:0]    M00_AXI_araddr;
    logic [2:0]     M00_AXI_arprot;
    logic           M00_AXI_arready;
    logic           M00_AXI_arvalid;
    logic [39:0]    M00_AXI_awaddr;
    logic [2:0]     M00_AXI_awprot;
    logic           M00_AXI_awready;
    logic           M00_AXI_awvalid;
    logic           M00_AXI_bready;
    logic [1:0]     M00_AXI_bresp;
    logic           M00_AXI_bvalid;
    logic [31:0]    M00_AXI_rdata;
    logic           M00_AXI_rready;
    logic [1:0]     M00_AXI_rresp;
    logic           M00_AXI_rvalid;
    logic [31:0]    M00_AXI_wdata;
    logic           M00_AXI_wready;
    logic [3:0]     M00_AXI_wstrb;
    logic           M00_AXI_wvalid;

    logic           axi_aclk;
    logic [0:0]     axi_aresetn;
    

//    system system_i (
//        .M00_AXI_araddr     (M00_AXI_araddr),
//        .M00_AXI_arprot     (M00_AXI_arprot),
//        .M00_AXI_arready    (M00_AXI_arready),
//        .M00_AXI_arvalid    (M00_AXI_arvalid),
//        .M00_AXI_awaddr     (M00_AXI_awaddr),
//        .M00_AXI_awprot     (M00_AXI_awprot),
//        .M00_AXI_awready    (M00_AXI_awready),
//        .M00_AXI_awvalid    (M00_AXI_awvalid),
//        .M00_AXI_bready     (M00_AXI_bready),
//        .M00_AXI_bresp      (M00_AXI_bresp),
//        .M00_AXI_bvalid     (M00_AXI_bvalid),
//        .M00_AXI_rdata      (M00_AXI_rdata),
//        .M00_AXI_rready     (M00_AXI_rready),
//        .M00_AXI_rresp      (M00_AXI_rresp),
//        .M00_AXI_rvalid     (M00_AXI_rvalid),
//        .M00_AXI_wdata      (M00_AXI_wdata),
//        .M00_AXI_wready     (M00_AXI_wready),
//        .M00_AXI_wstrb      (M00_AXI_wstrb),
//        .M00_AXI_wvalid     (M00_AXI_wvalid),
//        //
//        .axi_aclk           (axi_aclk),
//        .axi_aresetn        (axi_aresetn)
//    );
    
    system system_i (
        .DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        //
        .M00_AXI_araddr(M00_AXI_araddr),
        .M00_AXI_arprot(M00_AXI_arprot),
        .M00_AXI_arready(M00_AXI_arready),
        .M00_AXI_arvalid(M00_AXI_arvalid),
        .M00_AXI_awaddr(M00_AXI_awaddr),
        .M00_AXI_awprot(M00_AXI_awprot),
        .M00_AXI_awready(M00_AXI_awready),
        .M00_AXI_awvalid(M00_AXI_awvalid),
        .M00_AXI_bready(M00_AXI_bready),
        .M00_AXI_bresp(M00_AXI_bresp),
        .M00_AXI_bvalid(M00_AXI_bvalid),
        .M00_AXI_rdata(M00_AXI_rdata),
        .M00_AXI_rready(M00_AXI_rready),
        .M00_AXI_rresp(M00_AXI_rresp),
        .M00_AXI_rvalid(M00_AXI_rvalid),
        .M00_AXI_wdata(M00_AXI_wdata),
        .M00_AXI_wready(M00_AXI_wready),
        .M00_AXI_wstrb(M00_AXI_wstrb),
        .M00_AXI_wvalid(M00_AXI_wvalid),
        //
        .axi_aclk(axi_aclk),
        .axi_aresetn(axi_aresetn)
    );
    

    // This register file gives software contol over unit under test (UUT).
    logic [15:0][31:0] slv_reg, slv_read;

    assign slv_read[0] = 32'hdeadbeef;
    assign slv_read[1] = 32'h76543210;
    
    
    assign slv_read[15:2] = slv_reg[15:2];

	axi_regfile_v1_0_S00_AXI #	(
		.C_S_AXI_DATA_WIDTH(32),
		.C_S_AXI_ADDR_WIDTH(6) // 16 32 bit registers.
	) axi_regfile_inst (
        // register interface
        .slv_read(slv_read), 
        .slv_reg (slv_reg),  
        // axi interface
		.S_AXI_ACLK    (axi_aclk),
		.S_AXI_ARESETN (axi_aresetn),
        //
		.S_AXI_ARADDR  (M00_AXI_araddr ),
		.S_AXI_ARPROT  (M00_AXI_arprot ),
		.S_AXI_ARREADY (M00_AXI_arready),
		.S_AXI_ARVALID (M00_AXI_arvalid),
		.S_AXI_AWADDR  (M00_AXI_awaddr ),
		.S_AXI_AWPROT  (M00_AXI_awprot ),
		.S_AXI_AWREADY (M00_AXI_awready),
		.S_AXI_AWVALID (M00_AXI_awvalid),
		.S_AXI_BREADY  (M00_AXI_bready ),
		.S_AXI_BRESP   (M00_AXI_bresp  ),
		.S_AXI_BVALID  (M00_AXI_bvalid ),
		.S_AXI_RDATA   (M00_AXI_rdata  ),
		.S_AXI_RREADY  (M00_AXI_rready ),
		.S_AXI_RRESP   (M00_AXI_rresp  ),
		.S_AXI_RVALID  (M00_AXI_rvalid ),
		.S_AXI_WDATA   (M00_AXI_wdata  ),
		.S_AXI_WREADY  (M00_AXI_wready ),
		.S_AXI_WSTRB   (M00_AXI_wstrb  ),
		.S_AXI_WVALID  (M00_AXI_wvalid )
	);

endmodule
    
