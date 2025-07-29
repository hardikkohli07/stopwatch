module stopwatch_fsm(
    input wire clk,
    input wire rst,
    input wire start,
    input wire pause,
    output reg running
);
    typedef enum logic [1:0] {IDLE, RUN, PAUSE} state_t;
    state_t state, next_state;

    always @(*) 
    begin
        case (state)
            IDLE:   next_state = state_t'((start) ? RUN : IDLE);
            RUN:    next_state = state_t'((pause) ? PAUSE : RUN);
            PAUSE:  next_state = state_t'((start) ? RUN : PAUSE);
            default: next_state = state_t'(IDLE);
        endcase
    end

    always @(posedge clk or posedge rst) 
    begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) 
    begin
        running = (state == RUN);
    end
endmodule
