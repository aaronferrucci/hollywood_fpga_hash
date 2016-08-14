`default_nettype none
`timescale 1ns / 1ns

// desired output:
// r4 = feb1
// r6 = 9298
// hash algorithm:
// on each new password value abcd:
// r4' = r6 ^ cdab
// r6' = swapb(r4 + cdab)
module hollywood_unhash_core #(
    parameter R4 = 16'hFEB1,
    parameter R6 = 16'h9298
  )
  (
    // input password interface
    // channel 1: mgmt
    // channel 0: data
    input wire in_valid,
    input wire in_channel,
    input wire [15:0] in_data,

    // output success interface
    output reg out_valid,
    output reg [15:0] out_data,

    input wire clk,
    input wire reset
  );

  reg [15:0] r4, r6;

  wire [15:0] swapped = {in_data[7:0], in_data[15:8]};
  wire [15:0] next_r4, preswap_next_r6, next_r6;
  assign next_r4 = r6 ^ swapped;
  assign preswap_next_r6 = r4 + swapped;
  assign next_r6 = {preswap_next_r6[7:0], preswap_next_r6[15:8]};

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      r4 <= '0;
      r6 <= '0;
    end
    else begin
      if (in_valid) begin
        if (in_channel) begin
          r4 <= '0;
          r6 <= '0;
        end
        else begin
          r4 <= next_r4;
          r6 <= next_r6;
        end
      end
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      out_valid <= '0;
    end
    else begin
      out_valid <= (r6 == R6) && (r4 == R4);
    end
  end

  // out_data: unused
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      out_data <= '0;
    end
    else begin
        out_data <= '0;
    end
  end

endmodule

`default_nettype wire

