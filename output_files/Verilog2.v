module delay_500ms (
    input wire clk,          // System clock (1kHz)
    input wire rst,          // Active-high reset
    input wire trigger,      // Goes high to start delay
    output reg delayed_pulse // Goes high after 0.5s once
);

    reg [8:0] count; // Enough bits for 0 to 500 (2^9 = 512)
    reg active;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            delayed_pulse <= 0;
            active <= 0;
        end else begin
            if (trigger && !active) begin
                active <= 1;       // Start counting
                count <= 0;
                delayed_pulse <= 0;
            end else if (active) begin
                if (count < 9'd499) begin
                    count <= count + 1;
                end else begin
                    delayed_pulse <= 1; // Delay finished
                    active <= 0;        // Stop the counter
                end
            end else begin
                delayed_pulse <= 0; // Keep output low unless triggered
            end
        end
    end

endmodule
