`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2026 05:24:11 PM
// Design Name: 
// Module Name: zero_to_f_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module zero_to_f_testbench;

    reg D0;
    reg D1;
    reg D2;
    reg D3;

    wire Sa;
    wire Sb;
    wire Sc;
    wire Sd;
    wire Se;
    wire Sf;
    wire Sg;


    toF uut (
        .D0(D0),
        .D1(D1),
        .D2(D2),
        .D3(D3),

        .Sa(Sa),
        .Sb(Sb),
        .Sc(Sc),
        .Sd(Sd),
        .Se(Se),
        .Sf(Sf),
        .Sg(Sg)
    );

    initial begin

        D3 = 0; D2 = 0; D1 = 0; D0 = 0;
        #100;

        D3 = 0; D2 = 0; D1 = 0; D0 = 1;
        #100;

        D3 = 0; D2 = 0; D1 = 1; D0 = 0;
        #100;

        D3 = 0; D2 = 0; D1 = 1; D0 = 1;
        #100;

        D3 = 0; D2 = 1; D1 = 0; D0 = 0;
        #100;

        D3 = 0; D2 = 1; D1 = 0; D0 = 1;
        #100;

        D3 = 0; D2 = 1; D1 = 1; D0 = 0;
        #100;

        D3 = 0; D2 = 1; D1 = 1; D0 = 1;
        #100;

        D3 = 1; D2 = 0; D1 = 0; D0 = 0;
        #100;

        D3 = 1; D2 = 0; D1 = 0; D0 = 1;
        #100;

        D3 = 1; D2 = 0; D1 = 1; D0 = 0;
        #100;

        D3 = 1; D2 = 0; D1 = 1; D0 = 1;
        #100;

        D3 = 1; D2 = 1; D1 = 0; D0 = 0;
        #100;

        D3 = 1; D2 = 1; D1 = 0; D0 = 1;
        #100;

        D3 = 1; D2 = 1; D1 = 1; D0 = 0;
        #100;

        D3 = 1; D2 = 1; D1 = 1; D0 = 1;
        #100;

        $finish;

    end

endmodule
