`default_nettype none
`timescale 1ns / 1ns

module hollywood_hash(
  input  wire        in_valid,
  input  wire        in_channel,
  input  wire [15:0] in_data,
  output wire        out_valid,

  input  wire        clk,
  input  wire        reset
);
  test_core core (
    .clk_clk (clk),
    .reset_reset (reset),
    .out_valid (out_valid),
    .in_valid (in_valid),
    .in_channel (in_channel),
    .in_data (in_data),

    .out_data ()
  );

endmodule


`default_nettype wire
