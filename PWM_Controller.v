`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2026 12:11:38
// Design Name: 
// Module Name: PWM_Controller
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


module PWM_Controller(
    input clk,
    input [7:0] duty,
    output reg pwm_out
    );
    
    reg[7:0] counter;
    
    always @(posedge clk)
    begin
    
        counter <= counter +1'b1;
        
            if(counter < duty)
                pwm_out <= 1;
            else 
                pwm_out <= 0;
                
    end
endmodule
