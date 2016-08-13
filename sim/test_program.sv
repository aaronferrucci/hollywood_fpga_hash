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
        wait(`IN.signal_src_transaction_complete);
        @(posedge `CLK);

        send_password(48'habcdef0123XX);
        send_password(48'h4949b5de96XX);
        send_password(48'h55aa663301XX);
        send_password(48'h0004a53cf15b);

      end
    join_any

    wait(`IN.signal_src_transaction_complete);
    @(posedge `CLK);

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
  endtask

  task automatic in_send(input logic [15:0] data);
    `IN.set_transaction_data(data);
    `IN.set_transaction_channel(0);
    `IN.push_transaction();
  endtask

  task automatic send_password(input logic [47:0] password);
    in_send(password[47 -: 16]);
    in_send(password[47 - 16 -: 16]);
    in_send(password[47 - 32 -: 16]);
    mgmt_send();
  endtask

endmodule

`default_nettype wire
