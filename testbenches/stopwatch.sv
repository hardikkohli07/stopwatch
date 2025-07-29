`timescale 1ns/1ps

module stopwatch_tb;

    reg clk = 0, rst = 0, start = 0, pause = 0;
    wire [5:0] sec, min;

    // Device under test
    stopwatch_top uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .pause(pause),
        .sec(sec),
        .min(min)
    );

    // Generate clock
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, stopwatch_tb);

        $display("--- Starting Stopwatch Test ---");

        rst = 1; start = 0; pause = 0; #20;
        rst = 0; $display("Reset");

        start = 1; #10; start = 0; $display("Start");
        repeat (65) #10;

        pause = 1; #10; pause = 0; $display("Pause");
        repeat (15) #10;

        start = 1; #10; start = 0; $display("Resume");
        repeat (10) #10;

        rst = 1; #10; rst = 0; $display("Reset");
        repeat (5) #10;

        $display("Test complete");
        $finish;
    end

endmodule
