`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2023 06:56:32 PM
// Design Name: 
// Module Name: sumOn7segTop
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


module sumOn7segTop #(parameter W=16, N=3)(input clk, rstn,
                input logic s_valid,
                output logic s_ready,
                input logic [W-1:0] s_data,
                
                output logic m_valid,
                input logic m_ready,
                output logic m_data[2][7]

    );
    logic [W-1:0] m_data_temp;
    sumOn7seg #(
                .W(W),
                .N(N)
                ) sum1(
                .clk(clk),
                .rstn(rstn),
                .s_valid(s_valid),
                .s_ready(s_ready),
                .s_data(s_data),
                .m_valid(m_valid),
                .m_ready(m_ready),
                .m_data(m_data_temp)
                );
     sumOn7segConv#(.W(W)
                    ) display(
                    .s_data(m_data_temp),
                    .m_data(m_data)
    );
    
endmodule
