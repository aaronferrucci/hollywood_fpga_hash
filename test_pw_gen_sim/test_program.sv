`timescale 1ns/1ns
`default_nettype none

`define CLK sim_top.tb.test_pw_gen_inst_clock_bfm.clk
`define RESET sim_top.tb.test_pw_gen_inst_reset_bfm.reset
`define CSR sim_top.tb.test_pw_gen_inst_csr_bfm
`define OUT sim_top.tb.test_pw_gen_inst_out_bfm
`define REQ sim_top.tb.test_pw_gen_inst_req_bfm

`define DUT sim_top.tb.test_pw_gen_inst.pw_gen_0
module test_program;

  import avalon_mm_pkg::*;

  initial begin
    fork
      begin
        init();
        wait(~`RESET);
        repeat(2) @(posedge `CLK);

        test_run();
      end
      begin : drive_req
        repeat(100) @(negedge `OUT.sink_channel);
        $display("%t: 100 falling edges", $time());
        `REQ.set_transaction_data(0);
        `REQ.push_transaction();
      end
    join

    @(posedge `CLK);

    repeat(10) @(posedge `CLK);
    $stop;
  end

  task automatic init;
    `CSR.init();
    `OUT.init();
    `REQ.init();
  endtask

  task automatic test_run;
    
    `CSR.set_command_address(0);
    `CSR.set_command_data(1, 0);
    `CSR.set_command_request(REQ_WRITE);
    `CSR.push_command();
    repeat(5)
      @(posedge `CLK);

    repeat(3 * 65536) begin
      @(posedge `CLK);
      wait(`OUT.signal_transaction_received);
    end

    repeat(10)
      @(posedge `CLK);
  endtask

endmodule

`default_nettype wire
