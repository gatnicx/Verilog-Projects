`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2026 12:22:19
// Design Name: 
// Module Name: Traffic_light_controller
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


module Traffic_light_controller(
    input clk,
    input rst,
    input tick_1Hz,
    input pedestrian_req,
    output reg red,
    output reg yellow,
    output reg green
    );
    
    parameter GREEN_STATE  = 2'b00;
    parameter YELLOW_STATE = 2'b01;
    parameter RED_STATE    = 2'b10;
    
    reg [1:0] state;
    reg [3:0] timer;
    
    always@(posedge clk or posedge rst)
    begin
    
        if(rst)
        begin
            state <= GREEN_STATE;
            timer <= 4'd0;
        end
        else if(tick_1Hz)
        begin
            case(state)
            
            GREEN_STATE:
            begin
                if(timer >= 9 || pedestrian_req)
                begin
                    timer <= 0;
                    state <= YELLOW_STATE;
                end
                else
                    timer <= timer +1'b1;
            end
            
            YELLOW_STATE:
            begin
                if(timer >= 2)
                begin
                    timer <= 0;
                    state <= RED_STATE;
                end
                else
                    timer <= timer + 1'b1;
            end
            
            RED_STATE:
            begin
                if(timer >= 9)
                begin
                    timer <= 0;
                    state <= GREEN_STATE;
                end
                else
                    timer <= timer +1'b1;
            end
            
            default:
            begin
                state <= GREEN_STATE;
                timer <= 0;
            end
            
            endcase
        end
    end 
    
    always @(*)
    begin
        red    = 1'b0;
        yellow = 1'b0;
        green  = 1'b0;
        
        case(state)
            GREEN_STATE   : green  = 1'b1;
            YELLOW_STATE  : yellow = 1'b1;
            RED_STATE     : red    = 1'b1;
            default       : green  = 1'b1;
        endcase
    end       
endmodule
