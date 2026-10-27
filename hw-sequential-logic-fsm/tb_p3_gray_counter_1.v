`timescale 1ns/1ps
module tb_gray_counter;
    reg clk = 0, rst = 1;
    wire [2:0] out;
    gray_counter dut (.clk(clk), .rst(rst), .out(out));
    always #5 clk = ~clk;

    reg [2:0] gray [0:7];
    integer i, errors = 0;
    reg [2:0] prev;

    initial begin
        gray[0]=3'b000; gray[1]=3'b001; gray[2]=3'b011; gray[3]=3'b010;
        gray[4]=3'b110; gray[5]=3'b111; gray[6]=3'b101; gray[7]=3'b100;
        $dumpfile("gray.vcd"); $dumpvars(0, tb_gray_counter);

        // Test 1: reset forces 000
        @(posedge clk); #1;
        $display("reset asserted : out = %b", out);
        if (out !== 3'b000) errors = errors + 1;
        @(negedge clk); rst = 0;

        // Test 2: two full laps (16 clocks), check sequence and single-bit change
        prev = out;
        for (i = 1; i <= 16; i = i + 1) begin
            @(posedge clk); #1;
            $display("clock %2d : out = %b (expected %b)", i, out, gray[i % 8]);
            if (out !== gray[i % 8]) errors = errors + 1;
            if (((out ^ prev) & ((out ^ prev) - 1)) !== 3'b000) begin
                $display("   ** more than one bit changed"); errors = errors + 1;
            end
            prev = out;
        end

        // Test 3: reset in the middle of the sequence returns to 000
        // (3 more clocks first, so the counter is at 010 when reset hits)
        repeat (3) begin @(posedge clk); #1; end
        $display("before reset   : out = %b (expected 010)", out);
        if (out !== 3'b010) errors = errors + 1;
        @(negedge clk); rst = 1;
        @(posedge clk); #1;
        $display("mid-run reset  : out = %b", out);
        if (out !== 3'b000) errors = errors + 1;
        @(negedge clk); rst = 0;
        @(posedge clk); #1;
        $display("after reset +1 : out = %b", out);
        if (out !== 3'b001) errors = errors + 1;

        if (errors == 0) $display("\nALL TESTS PASSED");
        else             $display("\n%0d ERRORS", errors);
        $finish;
    end
endmodule
