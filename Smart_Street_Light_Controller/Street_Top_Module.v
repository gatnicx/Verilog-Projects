`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2026 13:26:34
// Design Name: 
// Module Name: Street_Top_Module
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


module Street_Top_Module(
    input clk_12mhz,
    input rst,
    input day_night,
    input vehicle_detect,
    input pedestrian_req,
    output street_pwm,
    output yellow,
    output red,
    output green,
    output [2:0]walk_signal
    );
    
    wire tick_1Hz;
    wire [7:0] brightness;
    
    Clock_Divider U1(
        .clk(clk_12mhz),
        .rst(rst),
        .tick_1Hz(tick_1Hz)
    );
    
    Smart_street_light_controller U2(
        .clk(clk_12mhz),
        .rst(rst),
        .tick_1Hz(tick_1Hz),
        .day_night(day_night),
        .vehicle_detect(vehicle_detect),
        .brightness(brightness)
    );
    
    PWM_Controller U3(
        .clk(clk_12mhz),
        .duty(brightness),
        .pwm_out(street_pwm)
    );
    
    Traffic_light_controller U4(
        .clk(clk_12mhz),
        .rst(rst),
        .tick_1Hz(tick_1Hz),
        .pedestrian_req(pedestrian_req),
        .red(red),
        .yellow(yellow),
        .green(green)
    );
    
    Pedestiran_Controller U5(
        .clk(clk_12mhz),
        .rst(rst),
        .tick_1Hz(tick_1Hz),
        .pedestrian_req(pedestrian_req),
        .walk_signal(walk_signal)
    );
    
endmodule
