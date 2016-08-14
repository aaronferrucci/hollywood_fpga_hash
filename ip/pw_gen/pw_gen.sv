`default_nettype none
`timescale 1ns / 1ns

module pw_gen(
    // input mgmt interface
    input wire in_valid,
    input wire in_data,

    // output password interface
    output reg out_valid,
    output reg out_channel,
    output reg [15:0] out_data,

    input wire clk,
    input wire reset
);
  reg [15:0] pw1;
  reg [15:0] pw2;
  reg [7:0] pw3;

  typedef enum {
    ST_IDLE,
    ST_MGMT,
    ST1,
    ST2,
    ST3
  } t_state;
  t_state state, p1_state;

  reg p1_channel;
  reg p1_valid;
  reg [15:0] p1_data;
  reg [15:0] p_pw1;
  reg [15:0] p_pw2;
  reg [7:0] p_pw3;

  reg run;
  reg pw1_overflow, pw2_overflow;
  always_comb begin : state_transition
    p1_state = ST_IDLE;
    p1_channel = '0;
    p1_data = '0;
    p1_valid = '0;

    p_pw1 = pw1;
    p_pw2 = pw2;
    p_pw3 = pw3;

    case (state)
      ST_IDLE: begin
        if (run) begin
          p1_state = ST1;
          p1_channel = '0;
          p_pw1 = pw1 + 1'b1;
          p1_valid = '1;
        end
      end
      ST1: begin
        p1_state = ST2;
        p1_channel = '0;
        p1_valid = '1;
        p1_data = pw2;
        if (pw1_overflow)
          p_pw2 = pw2 + 1'b1;
      end
      ST2: begin
        p1_state = ST3;
        p1_channel = '0;
        p1_valid = '1;
        p1_data = {pw3, 8'b0};
        if (pw2_overflow)
          p_pw3 = pw3 + 1'b1;
      end
      ST3: begin
        p1_state = ST_MGMT;
        p1_channel = '1;
        p1_data = '0;
        p1_valid = '1;
      end
      ST_MGMT: begin
        // conditional on run bit
        if (run) begin
          p1_state = ST1;
          p1_channel = '0;
          p1_valid = '1;
          p1_data = pw1;
          p_pw1 = pw1 + 1'b1;
        end
      end
    endcase
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      run <= '0;
    end
    else begin
      if (in_valid) begin
        run <= in_data;
      end
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      pw1 <= '0;
      pw2 <= '0;
      pw3 <= '0;
      pw1_overflow <= '0;
      pw2_overflow <= '0;
    end
    else begin
      pw1 <= p_pw1;
      pw2 <= p_pw2;
      pw3 <= p_pw3;
      pw1_overflow <= pw1 == 16'hFFFF;
      pw2_overflow <= pw1_overflow && (pw2 == 16'hFFFF);
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= ST_IDLE;
      out_channel <= '1;
      out_data <= '0;
      out_valid <= '0;
    end
    else begin
      state <= p1_state;
      out_channel <= p1_channel;
      out_data <= p1_data;
      out_valid <= p1_valid;
    end
  end
    
endmodule

`default_nettype wire

