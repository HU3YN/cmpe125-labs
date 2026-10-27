module GPFullAdder(
    input Ai,
    input Bi,
    input Cin,
    output G,
    output P,
    output Sum
);

    assign G = Ai & Bi;
    assign P = Ai ^ Bi;
    assign Sum = P ^ Cin;

endmodule


module CLALogic(
    input [3:0] G,
    input [3:0] P,
    input Ci,
    output [2:0] C,
    output Co,
    output PG,
    output GG
);

    assign C[0] = G[0] | (P[0] & Ci);

    assign C[1] = G[1] |
                  (P[1] & G[0]) |
                  (P[1] & P[0] & Ci);

    assign C[2] = G[2] |
                  (P[2] & G[1]) |
                  (P[2] & P[1] & G[0]) |
                  (P[2] & P[1] & P[0] & Ci);

    assign Co = G[3] |
                (P[3] & G[2]) |
                (P[3] & P[2] & G[1]) |
                (P[3] & P[2] & P[1] & G[0]) |
                (P[3] & P[2] & P[1] & P[0] & Ci);

    assign PG = P[3] & P[2] & P[1] & P[0];

    assign GG = G[3] |
                (P[3] & G[2]) |
                (P[3] & P[2] & G[1]) |
                (P[3] & P[2] & P[1] & G[0]);

endmodule


module CLA4(
    input [3:0] A,
    input [3:0] B,
    input Ci,
    output [3:0] S,
    output Co,
    output PG,
    output GG
);

    wire [3:0] G;
    wire [3:0] P;
    wire [2:0] C;

    GPFullAdder FA0 (
        .Ai(A[0]),
        .Bi(B[0]),
        .Cin(Ci),
        .G(G[0]),
        .P(P[0]),
        .Sum(S[0])
    );

    GPFullAdder FA1 (
        .Ai(A[1]),
        .Bi(B[1]),
        .Cin(C[0]),
        .G(G[1]),
        .P(P[1]),
        .Sum(S[1])
    );

    GPFullAdder FA2 (
        .Ai(A[2]),
        .Bi(B[2]),
        .Cin(C[1]),
        .G(G[2]),
        .P(P[2]),
        .Sum(S[2])
    );

    GPFullAdder FA3 (
        .Ai(A[3]),
        .Bi(B[3]),
        .Cin(C[2]),
        .G(G[3]),
        .P(P[3]),
        .Sum(S[3])
    );

    CLALogic CLA (
        .G(G),
        .P(P),
        .Ci(Ci),
        .C(C),
        .Co(Co),
        .PG(PG),
        .GG(GG)
    );

endmodule


module CLA4_basys3(
    input [8:0] sw,
    output [6:0] led
);

    wire [3:0] sum;
    wire cout;
    wire pg;
    wire gg;

    CLA4 adder (
        .A(sw[7:4]),
        .B(sw[3:0]),
        .Ci(sw[8]),
        .S(sum),
        .Co(cout),
        .PG(pg),
        .GG(gg)
    );

    assign led[3:0] = sum;
    assign led[4] = cout;
    assign led[5] = pg;
    assign led[6] = gg;

endmodule
