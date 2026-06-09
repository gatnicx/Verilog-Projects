`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2026 12:16:03
// Design Name: 
// Module Name: Smart_street_light_controller
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


module Smart_street_light_controller(
    input clk,
    input rst,
    input tick_1Hz,
    input day_night,
    input vehicle_detect,
    output reg [7:0] brightness
    );
    parameter OFF_BRIGHTNESS  = 8'd0;
    parameter DIM_BRIGHTNESS  = 8'd77;
    parameter FULL_BRIGHTNESS = 8'd255;
    
    always@(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            brightness <= OFF_BRIGHTNESS;
        end
        else if(tick_1Hz)
        begin
            if(day_night)
            begin
                brightness <= OFF_BRIGHTNESS;
            end
            else
            begin
                if(vehicle_detect)
                    brightness <= FULL_BRIGHTNESS;
                else
                    brightness <= DIM_BRIGHTNESS;
            end
        end
    end 
endmodule
