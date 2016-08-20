`default_nettype none
`timescale 1ns / 1ns

module pw_store(

  // input data interface
  input wire in_valid,
  input wire in_channel, // ch0: accept, ch1: ignore
  input wire [15:0] in_data,

  // input request interface
  input wire req_valid,
  input wire req_data, // unused

  // output store interface
  output reg store_valid,
  output reg [15:0] store_data,

  input wire clk,
  input wire reset
);

  // data is captured in a series of shift registers
  // if req_valid becomes active, the "right" sequence
  // of previously-received in_data values is drive on
  // the output store interface
  //
  reg [15:0] d1_in_data;
  reg [15:0] d2_in_data;
  reg [15:0] d3_in_data;
  reg [15:0] d4_in_data;
  reg [15:0] d5_in_data;
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      d1_in_data <= '0;
      d2_in_data <= '0;
      d3_in_data <= '0;
      d4_in_data <= '0;
      d5_in_data <= '0;
    end
    else begin
      if (in_valid && (in_channel == 1'b0)) begin
        d1_in_data <= in_data;
        d2_in_data <= d1_in_data;
        d3_in_data <= d2_in_data;
        d4_in_data <= d3_in_data;
        d5_in_data <= d4_in_data;
      end
    end
  end

  reg d1_req_valid;
  reg d2_req_valid;
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      d1_req_valid <= '0;
      d2_req_valid <= '0;
    end
    else begin
      d1_req_valid <= req_valid;
      d2_req_valid <= d2_req_valid;
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      store_valid <= '0;
      store_data <= '0;
    end
    else begin
      if (req_valid | d1_req_valid | d2_req_valid) begin
        store_valid <= '1;
        store_data <= d5_in_data;
      end
    end
  end

endmodule

`default_nettype wire
