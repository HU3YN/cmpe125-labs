`timescale 1ns/1ps
//============================================================
// Problem 3: 3-bit modulo-8 Gray code counter (Moore FSM)
// No inputs (other than clk/reset), three outputs.
// The state register holds the Gray code itself, so the outputs
// are simply the state bits.
// Sequence: 000 -> 001 -> 011 -> 010 -> 110 -> 111 -> 101 -> 100 -> 000
//============================================================
module gray_counter (
    input        clk,
    input        rst,       // synchronous, active-high
    output [2:0] out
);
    localparam S0 = 3'b000, S1 = 3'b001, S2 = 3'b011, S3 = 3'b010,
               S4 = 3'b110, S5 = 3'b111, S6 = 3'b101, S7 = 3'b100;

    reg [2:0] state, next_state;

    // state register
    always @(posedge clk)
        if (rst) state <= S0;
        else     state <= next_state;

    // next-state logic
    always @(*) begin
        case (state)
            S0:      next_state = S1;
            S1:      next_state = S2;
            S2:      next_state = S3;
            S3:      next_state = S4;
            S4:      next_state = S5;
            S5:      next_state = S6;
            S6:      next_state = S7;
            S7:      next_state = S0;
            default: next_state = S0;
        endcase
    end

    // output logic (Moore: depends on state only)
    assign out = state;
endmodule
