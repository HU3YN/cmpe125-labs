`timescale 1ns/1ps
// Testbench for Problem 2 (top module for simulation: tb_flipflops)
module tb_flipflops;
    reg clk = 0, rst = 1;
    reg j = 0, k = 0, d = 0, t = 0;
    wire q_jk, q_dj, q_tj;

    jk_ff          u2 (.clk(clk), .rst(rst), .j(j), .k(k), .q(q_jk));
    d_ff_from_jk   u3 (.clk(clk), .rst(rst), .d(d), .q(q_dj));
    t_ff_from_jk   u4 (.clk(clk), .rst(rst), .t(t), .q(q_tj));

    always #5 clk = ~clk;                       // 10 ns period

    reg e_jk = 0, e_dj = 0, e_tj = 0;           // reference model
    integer errors = 0;

    task step(input jv, input kv, input dv, input tv);
    begin
        @(negedge clk);                         // change inputs away from the rising edge
        j = jv; k = kv; d = dv; t = tv;
        // reference model: what should happen at the next rising edge
        case ({jv, kv})
            2'b00: e_jk = e_jk;                 // hold
            2'b01: e_jk = 1'b0;                 // reset
            2'b10: e_jk = 1'b1;                 // set
            2'b11: e_jk = ~e_jk;                // toggle
        endcase
        e_dj = dv;
        e_tj = e_tj ^ tv;
        @(posedge clk); #1;                     // look just after the edge
        $display("%6t |  %b %b |  %b |  %b |  %b    %b    %b",
                 $time, j, k, d, t, q_jk, q_dj, q_tj);
        if (q_jk !== e_jk || q_dj !== e_dj || q_tj !== e_tj) begin
            errors = errors + 1;
            $display("       ** MISMATCH: expected JK=%b D=%b T=%b", e_jk, e_dj, e_tj);
        end
    end
    endtask

    initial begin
        $display("  time | J K | D | T | Q_JK Q_D(JK) Q_T(JK)");
        $display("-------+-----+---+---+---------------------");
        @(posedge clk); #1 rst = 0;             // release reset just after an edge (all Q = 0)
        //    J K  D T
        step(0,0, 0,0);   // JK hold (0)
        step(1,0, 1,1);   // JK set -> 1; D=1; T toggles -> 1
        step(0,0, 1,0);   // JK hold (1); T holds
        step(0,1, 0,1);   // JK reset -> 0; D=0; T toggles -> 0
        step(1,1, 1,1);   // JK toggle -> 1; D=1; T toggles -> 1
        step(1,1, 0,1);   // JK toggle -> 0; D=0; T toggles -> 0
        step(1,0, 1,0);   // JK set -> 1
        step(0,0, 1,0);   // JK hold (1)
        step(0,1, 0,0);   // JK reset -> 0
        step(1,1, 1,1);   // JK toggle -> 1
        if (errors == 0) $display("\nALL TESTS PASSED");
        else             $display("\n%0d MISMATCHES", errors);
        $finish;
    end
endmodule
