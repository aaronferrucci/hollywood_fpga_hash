`timescale 1ns/1ns
`default_nettype none

`define CLK sim_top.tb.test_core_inst_clk_bfm.clk
`define RESET sim_top.tb.test_core_inst_reset_bfm.reset
module test_program;

  initial begin
    wait(`RESET);
    repeat(10) @(posedge `CLK);
    $stop;
  end

endmodule

`default_nettype wire
