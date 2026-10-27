`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 04:29:14 PM
// Design Name: 
// Module Name: fulladdertestbench
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


module fulladdertestbench;
    reg sw0;
    reg sw1;
    reg sw2;

    wire led0;
    wire led1;

    fulladder uut (
        .sw0(sw0),
        .sw1(sw1),
        .sw2(sw2),
        .led0(led0),
        .led1(led1)
    );

    // Test sequence
    initial begin
       
        // All 8 combinations
        sw2 = 0; sw1 = 0; sw0 = 0; #100;
        sw2 = 0; sw1 = 0; sw0 = 1; #100;
        sw2 = 0; sw1 = 1; sw0 = 0; #100;
        sw2 = 0; sw1 = 1; sw0 = 1; #100;
        sw2 = 1; sw1 = 0; sw0 = 0; #100;
        sw2 = 1; sw1 = 0; sw0 = 1; #100;
        sw2 = 1; sw1 = 1; sw0 = 0; #100;
        sw2 = 1; sw1 = 1; sw0 = 1; #100;

        $finish;
    end

endmodule
