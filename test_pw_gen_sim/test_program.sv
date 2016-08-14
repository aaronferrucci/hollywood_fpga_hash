`timescale 1ns/1ns
`default_nettype none

`define CLK sim_top.tb.test_pw_gen_inst_clock_bfm.clk
`define RESET sim_top.tb.test_pw_gen_inst_reset_bfm.reset

`define IN sim_top.tb.test_pw_gen_inst_in_bfm
`define OUT sim_top.tb.test_pw_gen_inst_out_bfm

`define DUT sim_top.tb.test_pw_gen_inst.pw_gen_0
module test_program;

  initial begin
    fork
      begin
        init();
        wait(~`RESET);
        repeat(2) @(posedge `CLK);

        test_run();
        // test_pw1_overflow();
      end
    join_any

    @(posedge `CLK);

    repeat(10) @(posedge `CLK);
    $stop;
  end

  task automatic init;
    `IN.init();
    `OUT.init();
  endtask

  task automatic test_run;
    `IN.set_transaction_data(1);
    `IN.push_transaction();
    
    repeat(3 * 65536) begin
      @(posedge `CLK);
      wait(`OUT.signal_transaction_received);
    end

    `IN.set_transaction_data(0);
    `IN.push_transaction();

    repeat(10)
      @(posedge `CLK);
  endtask

//  task automatic test_pw1_overflow;
//    `DUT.p_pw1 = 16'hFFFF;
//    `DUT.pw1 = 16'hFFFF;
//    @(posedge `CLK);
//
//    `IN.set_transaction_data(1);
//    `IN.push_transaction();
//
//    repeat(10) begin
//      @(posedge `CLK);
//      wait(`OUT.signal_transaction_received);
//    end
//
//    `IN.set_transaction_data(0);
//    `IN.push_transaction();
//
//    repeat(10)
//      @(posedge `CLK);
//  endtask


endmodule

`default_nettype wire
