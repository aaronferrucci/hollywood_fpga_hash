`default_nettype none
`timescale 1ns / 1ns

module hollywood_hash_top(
  output wire [4:0] LED,
  input wire  clk_50,
  input wire  global_reset_n
);
  wire pll_locked;
  wire [4:0] pio_val;

  hollywood_hash hasher (
    .reset_bridge_0_in_reset_reset_n (global_reset_n),
    .clk_50_in_clk (clk_50),

    .clk_adc_out_clk (),
    .leds_export (pio_val),

    .pll_areset_conduit_export (1'b0),
    .pll_locked_conduit_export (pll_locked)
  );

  assign LED = ~pio_val;

endmodule
`default_nettype wire

