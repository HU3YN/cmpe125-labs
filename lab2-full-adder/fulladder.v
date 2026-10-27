`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 03:53:04 PM
// Design Name: 
// Module Name: fulladder
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


module fulladder(
    output led0,
    output led1,
    input sw0,
    input sw1,
    input sw2
    );
    assign led0 = sw0 ^ sw1 ^ sw2;

    assign led1 = (sw0 & sw1) | (sw2 & (sw0 ^ sw1));
    

endmodule
