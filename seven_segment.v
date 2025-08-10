`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 01:35:04 PM
// Design Name: 
// Module Name: seven_segment_decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seven_segment_decoder(
        input in0,in1,in2,in3,
        output reg a,b,c,d,e,f,g
    );
    wire [3:0] in = {in3,in2,in1,in0};
    reg [6:0] out;
    always @(*) begin
        case (in)	  //-abcdefg;
            0:out = 7'b0000001;
            1:out = 7'b1001111;
            2:out = 7'b0010010;
            3:out = 7'b0000110;
            4:out = 7'b1001100;
            5:out = 7'b0100100;
            6:out = 7'b0100000;
            7:out = 7'b0001111;
            8:out = 7'b0000000;
            9:out = 7'b0001100;
            default: out=7'b0000000;
         endcase
         a=out[6];
         b=out[5];
         c=out[4];
         d=out[3];
         e=out[2];
         f=out[1];
         g=out[0];
     end
endmodule
