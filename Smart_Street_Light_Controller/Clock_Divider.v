`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2026 13:02:31
// Design Name: 
// Module Name: Clock_Divider
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


module Clock_Divider(
    input clk,
    input rst,
    output reg tick_1Hz
    );
    
    reg [23:0] count;
    
    always@ (posedge clk or posedge rst)
    begin
        if(rst)
        begin
            count <= 24'd0;
            tick_1Hz <= 1'b0;
        end
        
        else
        begin
            if(count == 24'd11999999)
            begin
                count <= 24'd0;
                tick_1Hz <= 1'b1;
            end
            else
            begin
                count <= count + 1'b1;
                tick_1Hz <= 1'b0;
            end
        end
    end
endmodule
