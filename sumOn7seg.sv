`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2023 12:10:26 PM
// Design Name: 
// Module Name: sumOn7seg
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


module sumOn7seg #(parameter W=16, N=3)(input clk, rstn,
                input logic s_valid,
                output logic s_ready,
                input logic [W-1:0] s_data,
                
                output logic m_valid,
                input logic m_ready,
                output logic [W-1:0] m_data

    );
    localparam cBit=$clog2(N)+1;

    logic [W-1:0] sum;
    logic [cBit-1:0] count;
    
    
//    assign m_data=sum;   //becasue m_data will be chnaged after wards
    always_ff @(posedge clk or negedge rstn)
        if(!rstn) 
        begin
            count <=0;
            sum<=0;
            s_ready<=1;
            m_valid<=0;
        end
        else 
        if (s_valid & s_ready & count <N) begin
            count <= count+1;
            sum <=sum + s_data;  
        end
     always_ff @(posedge clk)
        if (count == N & m_ready) begin
            m_data<=sum;
            m_valid<=1;
            s_ready<=0;
            count<=count+1;
        end
        else if (count == N+1 ) begin
            sum<=0;
            s_ready<=1;
            m_valid<=0;
            count<=0;
        end
                            
endmodule
