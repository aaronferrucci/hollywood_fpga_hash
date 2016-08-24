`default_nettype none
`timescale 1ns / 1ns

module pw_gen #(
  parameter 
    PW1_RESET = 16'b0,
    PW2_RESET = 16'b0,
    PW3_RESET = 8'b0,
    PW3_FINAL = 8'hFF) (

    // input mgmt interface
    input wire in_write,
    input wire in_read,
    input wire in_addr, // unused
    input wire [31:0] in_writedata,
    output reg [31:0] in_readdata,

    // output password interface
    output reg out_valid,
    output reg out_channel,
    output reg [15:0] out_data,

    // input store_request interface
    input wire req_valid,
    input wire req_data, // unused

    // output store interface
    output reg store_write,
    output reg [5:0] store_addr,
    output reg [15:0] store_writedata,
    input wire store_waitrequest,

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
  reg pw1_overflow, pw2_overflow, pw3_overflow;
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
        else begin
          p_pw1 = PW1_RESET[15:0];
          p_pw2 = PW2_RESET[15:0];
          p_pw3 = PW3_RESET[7:0];
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
        else begin
          p1_state = ST_IDLE;
        end
      end
    endcase
  end

  always @*
    in_readdata = { {31 {1'b0}}, run};

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      run <= '0;
    end
    else begin
      if (in_write) begin
        run <= in_writedata[0];
      end
      else if (pw3_overflow) begin
        run <= '0;
      end
    end
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      pw1 <= PW1_RESET[15:0];
      pw2 <= PW2_RESET[15:0];
      pw3 <= PW3_RESET[7:0];
      pw1_overflow <= '0;
      pw2_overflow <= '0;
      pw3_overflow <= '0;
    end
    else begin
      pw1 <= p_pw1;
      pw2 <= p_pw2;
      pw3 <= p_pw3;
      pw1_overflow <= pw1 == 16'hFFFF;
      pw2_overflow <= pw1_overflow && (pw2 == 16'hFFFF);
      pw3_overflow <= pw1_overflow && pw2_overflow && (pw3 == PW3_FINAL);
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
    
  reg received_req;
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      store_write <= '0;
      store_writedata <= '0;
      store_addr <= '0;
      received_req <= '0;
    end
    else begin
      // Note: waitrequest is ignored!
      store_write <= p1_valid;
      store_writedata <= p1_data;
      if (req_valid)
        received_req <= '1;
      else if (state == ST_MGMT)
        received_req <= '0;
      if (p1_valid) begin
        if (state == ST_IDLE) begin
          store_addr <= '0;
        end
        else if (!received_req && (state == ST_MGMT)) begin
          store_addr &= 6'b11_1000;
        end
        else begin
          store_addr <= store_addr + 6'h2;
        end

      end
    end
  end

endmodule

`default_nettype wire

