module sync_counter #(
    parameter WIDTH = 6,
    parameter MAX_VALUE = 59
) (
    input wire clk,
    input wire rst,
    input wire en,                  
    output reg [WIDTH-1:0] value,
    output wire rollover            
);
    assign rollover = (value == MAX_VALUE) && en;

    always @(posedge clk or posedge rst) 
    begin
        if (rst)
            value <= 0;
        else if (en) begin
            if (value == MAX_VALUE)
                value <= 0;
            else
                value <= value + 1;
        end
    end
endmodule
