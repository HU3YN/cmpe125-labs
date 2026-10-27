`timescale 1ns/1ps
module tb_and_or_fsm;
    reg clk = 0, rst = 1, a = 0, b = 0;
    wire z;
    and_or_fsm dut (.clk(clk), .rst(rst), .a(a), .b(b), .z(z));
    always #5 clk = ~clk;

    reg a_prev = 0, exp_z = 0;
    integer errors = 0, n = 0;

    // apply inputs after the falling edge, check Z just before the rising edge
    task cycle(input av, input bv);
    begin
        @(negedge clk); a = av; b = bv;
        exp_z = bv ? (av | a_prev) : (av & a_prev);
        #4;                                   // let combinational output settle
        n = n + 1;
        $display("cycle %2d: A=%b B=%b  A(n-1)=%b  Z=%b  (expected %b)", n, a, b, a_prev, z, exp_z);
        if (z !== exp_z) errors = errors + 1;
        @(posedge clk);
        a_prev = av;
    end
    endtask

    initial begin
        $dumpfile("fsm.vcd"); $dumpvars(0, tb_and_or_fsm);
        #12 rst = 0;
        // Waveform from Problem 4a (as read from the figure)
        cycle(0,0); cycle(0,0); cycle(1,0); cycle(1,0);
        cycle(0,0); cycle(0,1); cycle(1,1); cycle(1,1);
        // Extra tests: all combinations of (A(n-1), A, B)
        cycle(0,1); cycle(0,0); cycle(1,1); cycle(1,0); cycle(0,1);
        cycle(1,1); cycle(1,1); cycle(0,0); cycle(0,1);
        if (errors == 0) $display("\nALL TESTS PASSED");
        else             $display("\n%0d ERRORS", errors);
        $finish;
    end
endmodule
