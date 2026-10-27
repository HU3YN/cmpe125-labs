    `timescale 1ns / 1ps
    //////////////////////////////////////////////////////////////////////////////////
    // Company: 
    // Engineer: 
    // 
    // Create Date: 09/15/2026 04:21:27 PM
    // Design Name: 
    // Module Name: 0 to F
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
    
    
    module toF(
      
        input D0,
        input D1,
        input D2,
        input D3,
        output Sa,
        output Sb,
        output Sc,
        output Sd,
        output Se,
        output Sf,   
        output Sg,
        output an0,
        output an1,
        output an2,
        output an3
        );
    assign an0 = 0;
    assign an1 = 1;
    assign an2 = 1;
    assign an3 = 1;
    
        assign Sa = (D2 & D3 & ~D1) |
                (D2 & ~D0 & ~D1) |
                (D0 & D1 & D3 & ~D2) |
                (D0 & ~D1 & ~D2 & ~D3);
    
    assign Sb = (D0 & D1 & D3) |
                (D1 & D2 & ~D0) |
                (D2 & D3 & ~D0) |
                (D0 & D2 & ~D1 & ~D3);
    
    assign Sc = (D1 & D2 & D3) |
                (D2 & D3 & ~D0) |
                (D1 & ~D0 & ~D2 & ~D3);
    
    assign Sd = (D0 & D1 & D2) |
                (D0 & ~D1 & ~D2) |
                (D1 & D3 & ~D0 & ~D2) |
                (D2 & ~D0 & ~D1 & ~D3);
    
    assign Se = (D0 & ~D3) |
                (D0 & ~D1 & ~D2) |
                (D2 & ~D1 & ~D3);
    
    assign Sf = (D0 & D1 & ~D3) |
                (D2 & D3 & ~D1) |
                (D0 & ~D2 & ~D3) |
                (D1 & ~D2 & ~D3);
    
    assign Sg = (~D1 & ~D2 & ~D3) |
                (D0 & D1 & D2 & ~D3);
    
    
    
     
    endmodule
