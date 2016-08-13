`timescale 1ns/1ns
`default_nettype none

`define CLK sim_top.tb.test_core_inst_clk_bfm.clk
`define RESET sim_top.tb.test_core_inst_reset_bfm.reset

`define IN sim_top.tb.test_core_inst_in_bfm
`define OUT sim_top.tb.test_core_inst_out_bfm
`define MGMT sim_top.tb.test_core_inst_mgmt_bfm
module test_program;

  initial begin
    fork
      begin
        init();
        wait(~`RESET);
        repeat(2) @(posedge `CLK);

        mgmt_send();

        in_send(16'h4949);
        in_send(16'hb5de);
        in_send(16'h9600);

      end
    join_any

    repeat(10) @(posedge `CLK);
    $stop;
  end

  task automatic init;
    `IN.init();
    `MGMT.init();
    `OUT.init();
  endtask

  task automatic mgmt_send;
    `MGMT.set_transaction_data(8'hX);
    `MGMT.push_transaction();

    wait(`MGMT.signal_src_transaction_complete);
    @(posedge `CLK);
  endtask

  task automatic in_send(input logic [15:0] data);
    `IN.set_transaction_data(data);
    `IN.push_transaction();
  endtask

endmodule

`default_nettype wire
