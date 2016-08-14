`timescale 1ns/1ns
`default_nettype none

`define CLK sim_top.tb.test_pw_gen_inst_clock_bfm.clk
`define RESET sim_top.tb.test_pw_gen_inst_reset_bfm.reset

`define OUT sim_top.tb.test_pw_gen_inst_out_bfm
module test_program;

  initial begin
    fork
      begin
        init();
        wait(~`RESET);
        repeat(2) @(posedge `CLK);

      end
    join_any

    @(posedge `CLK);

    repeat(10) @(posedge `CLK);
    $stop;
  end

  task automatic init;
    `OUT.init();
  endtask

endmodule

`default_nettype wire
