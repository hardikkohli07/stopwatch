module stopwatch_top(
    input wire clk,
    input wire rst,
    input wire start,       // Start button
    input wire pause,       // Pause button
    output wire [5:0] sec,  // Seconds [0-59]
    output wire [5:0] min   // Minutes [0-59]
);

    // FSM Controller
    wire running;
    stopwatch_fsm fsm(
        .clk(clk),
        .rst(rst),
        .start_btn(start),
        .pause_btn(pause),
        .running(running)
    );

    // Seconds counter
    wire sec_rollover;
    sync_counter #(.WIDTH(6), .MAX_VALUE(59)) sec_counter(
        .clk(clk),
        .rst(rst),
        .en(running),
        .value(sec),
        .rollover(sec_rollover)
    );

    // Minutes counter
    sync_counter #(.WIDTH(6), .MAX_VALUE(59)) min_counter(
        .clk(clk),
        .rst(rst),
        .en(running && sec_rollover),
        .value(min),
        .rollover()
    );
endmodule
