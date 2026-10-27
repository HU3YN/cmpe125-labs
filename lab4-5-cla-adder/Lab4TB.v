`timescale 1ns / 1ps

module Lab4TB;

    reg [3:0] A;
    reg [3:0] B;
    reg Ci;

    wire [3:0] S;
    wire Co;
    wire PG;
    wire GG;

    CLA4 uut (
        .A(A),
        .B(B),
        .Ci(Ci),
        .S(S),
        .Co(Co),
        .PG(PG),
        .GG(GG)
    );

    initial begin

        // Test 1: 4 + 5 = 9
        A = 4'b0100;
        B = 4'b0101;
        Ci = 1'b0;
        #10;

        // Test 2: 9 + 11 + 1 = 21
        A = 4'b1001;
        B = 4'b1011;
        Ci = 1'b1;
        #10;

        $finish;

    end

endmodule

