`timescale 1ns/1ps
//============================================================
// Problem 4: Mealy FSM, inputs A and B, output Z
//   Zn = An & An-1   when Bn = 0
//   Zn = An | An-1   when Bn = 1
// State S = previous value of A (S0: An-1 = 0, S1: An-1 = 1)
// Encoding: S0 = 0, S1 = 1 (one state bit, S)
//   Next state : S' = A
//   Output     : Z  = S.A + S.B + A.B   (majority of S, A, B)
//============================================================
module and_or_fsm (
    input  clk,
    input  rst,     // synchronous, active-high; resets previous A to 0
    input  a,
    input  b,
    output z
);
    reg s;                      // state: previous A

    // state register
    always @(posedge clk)
        if (rst) s <= 1'b0;
        else     s <= a;        // S' = A

    // Mealy output: depends on state AND current inputs
    assign z = (s & a) | (s & b) | (a & b);
endmodule
