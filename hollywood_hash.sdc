create_clock -name clock -period 20 [get_ports *clk_50*]
derive_clock_uncertainty
