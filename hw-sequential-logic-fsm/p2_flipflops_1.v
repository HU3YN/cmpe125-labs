`timescale 1ns/1ps
//============================================================
// CMPE 125 Hw - Sequential Logic and FSM
// Problem 2: JK, D and T flip-flops built hierarchically
//   (a) JK flip-flop from a D flip-flop + gates
//   (b) D flip-flop from the JK flip-flop
//   (c) T flip-flop from the JK flip-flop
// Only the base dff has a clocked always block; every other
// module is structural (gates + module instances).
// An asynchronous active-high reset (rst) is on the base D
// flip-flop only, so simulation starts from a known state.
//============================================================

// ---------- Base cell: positive-edge D flip-flop ----------
module dff (
    input  clk,
    input  rst,
    input  d,
    output reg q
);
    always @(posedge clk or posedge rst)
        if (rst) q <= 1'b0;
        else     q <= d;
endmodule

// ---------- (a) JK flip-flop from a D flip-flop ----------
// Characteristic equation:  Q+ = J.~Q + ~K.Q   ->  D = J.~Q + ~K.Q
module jk_ff (
    input  clk,
    input  rst,
    input  j,
    input  k,
    output q
);
    wire nq, nk, jnq, nkq, d;
    not  g_nq  (nq,  q);
    not  g_nk  (nk,  k);
    and  g_jnq (jnq, j,  nq);
    and  g_nkq (nkq, nk, q);
    or   g_d   (d,   jnq, nkq);
    dff  u_dff (.clk(clk), .rst(rst), .d(d), .q(q));
endmodule

// ---------- (b) D flip-flop from the JK flip-flop ----------
// J = D, K = ~D  ->  Q+ = D
module d_ff_from_jk (
    input  clk,
    input  rst,
    input  d,
    output q
);
    wire nd;
    not  g_nd (nd, d);
    jk_ff u_jk (.clk(clk), .rst(rst), .j(d), .k(nd), .q(q));
endmodule

// ---------- (c) T flip-flop from the JK flip-flop ----------
// J = K = T  ->  Q+ = T xor Q  (T = 1 toggles, T = 0 holds)
module t_ff_from_jk (
    input  clk,
    input  rst,
    input  t,
    output q
);
    jk_ff u_jk (.clk(clk), .rst(rst), .j(t), .k(t), .q(q));
endmodule
