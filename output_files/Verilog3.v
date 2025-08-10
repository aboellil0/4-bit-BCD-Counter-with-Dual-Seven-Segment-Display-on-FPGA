module delay_500ms_on_start (
    input wire clk,    // 50 MHz system clock
    input wire rst,    // Active-high synchronous reset
    output reg done    // Goes high after 0.5 sec, stays high
);

    reg [24:0] count;
    reg started;

    always @(posedge clk) begin
        if (rst) begin
            count <= 0;
            done <= 0;
            started <= 0;
        end else begin
            if (!started) begin
                started <= 1; // Begin the delay
                count <= 0;
                done <= 0;
            end else if (!done) begin
                if (count < 25_000_000 - 1) begin
                    count <= count + 1;
                end else begin
                    done <= 1; // Delay finished
                end
            end
        end
    end

endmodule
