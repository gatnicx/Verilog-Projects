`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2026 12:50:49
// Design Name: 
// Module Name: Pedestiran_Controller
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


module Pedestiran_Controller(
    input clk,
    input rst,
    input tick_1Hz,
    input pedestrian_req,
    output reg [2:0]walk_signal
    );
    
    reg active;
    
    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            walk_signal <= 3'd0;
            active <= 1'b0;
        end
        else if(tick_1Hz)
        begin
            if(pedestrian_req && !active)
            begin
                walk_signal <= 3'd5;
                active  <= 1'b1;
            end
            else if(active)
            begin
                if(walk_signal >3'd0)
                begin
                    walk_signal <= walk_signal - 3'b1;
                end
                else
                begin
                    walk_signal <= 3'd0;
                    active <= 1'b0;
                end
            end
        end
    end
endmodule
