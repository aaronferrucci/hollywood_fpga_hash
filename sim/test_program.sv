`timescale 1ns/1ns
`default_nettype none

`define CLK sim_top.tb.test_core_inst_clk_bfm.clk
`define RESET sim_top.tb.test_core_inst_reset_bfm.reset

`define IN sim_top.tb.test_core_inst_in_bfm
`define OUT sim_top.tb.test_core_inst_out_bfm
`define MGMT sim_top.tb.test_core_inst_mgmt_bfmt
module test_program;

  initial begin
    wait(~`RESET);
    repeat(10) @(posedge `CLK);
    $stop;
  end

endmodule

`default_nettype wire
