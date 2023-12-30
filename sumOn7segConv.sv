`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2023 05:00:46 PM
// Design Name: 
// Module Name: sumOn7segConv
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


module sumOn7segConv#(parameter W=16)(
                input  logic [W-1:0] s_data,
                output logic m_data [2][7]
    );
    logic [3:0]digit0 = 4'({s_data % 10});
    logic [3:0]digit1 = 4'({s_data / 10});
    logic [6:0]temp1;
    logic [6:0]temp2;
//always block for converting bcd digit into 7 segment format
    always @(s_data)
    begin
        case (s_data % 10) //case statement
            4'd0 : temp1= 7'b0000001;
            4'd1 : temp1 = 7'b1001111;
            4'd2 : temp1= 7'b0010010;
            4'd3 : temp1 = 7'b0000110;
            4'd4 : temp1 = 7'b1001100;
            4'd5 : temp1 = 7'b0100100;
            4'd6 : temp1 = 7'b0100000;
            4'd7 : temp1 = 7'b0001111;
            4'd8 : temp1 = 7'b0000000;
            4'd9 : temp1 = 7'b0000100;
            //switch off 7 segment character when the bcd digit is not a decimal number.
            default : temp1 = 7'b1111111; 
        endcase
    end
    //always block for converting bcd digit into 7 segment format
    always @(s_data)
    begin
        case (s_data /10) //case statement
            0 : temp2 = 7'b0000001;
            1 : temp2 = 7'b1001111;
            2 : temp2 = 7'b0010010;
            3 : temp2 = 7'b0000110;
            4 : temp2 = 7'b1001100;
            5 : temp2 = 7'b0100100;
            6 : temp2 = 7'b0100000;
            7 : temp2 = 7'b0001111;
            8 : temp2 = 7'b0000000;
            9 : temp2 = 7'b0000100;
            //switch off 7 segment character when the bcd digit is not a decimal number.
            default : temp2 = 7'b1111111; 
        endcase
    end
    assign {>>{m_data[0]}}= {temp1};
    assign {>>{m_data[1]}}= {temp2};
endmodule
