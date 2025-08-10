module one_cycle_delay (
    input wire clk,    // Clock input
    input wire rst,    // Active-high synchronous reset
    input wire in,     // Input signal
    output reg out     // Output is delayed by 1 clock cycle
);

    reg in_reg;

    always @(posedge clk) begin
        if (rst) begin
            in_reg <= 0;
            out <= 0;
        end else begin
            in_reg <= in;  // Store input
            out <= in_reg; // Output delayed value
        end
    end

endmodule