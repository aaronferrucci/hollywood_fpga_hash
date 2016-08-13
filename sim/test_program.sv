`timescale 1ns/1ns
`default_nettype none

`define CLK sim_top.tb.test_core_inst_clk_bfm.clk
`define RESET sim_top.tb.test_core_inst_reset_bfm.reset

`define IN sim_top.tb.test_core_inst_in_bfm
`define OUT sim_top.tb.test_core_inst_out_bfm
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
    `OUT.init();
  endtask

  task automatic mgmt_send;
    `IN.set_transaction_data(16'hX);
    `IN.set_transaction_channel(1);
    `IN.push_transaction();

    wait(`IN.signal_src_transaction_complete);
    @(posedge `CLK);
  endtask

  task automatic in_send(input logic [15:0] data);
    `IN.set_transaction_data(data);
    `IN.set_transaction_channel(0);
    `IN.push_transaction();
  endtask

endmodule

`default_nettype wire
