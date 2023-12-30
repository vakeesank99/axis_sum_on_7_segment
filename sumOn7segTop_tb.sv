`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2023 07:04:54 PM
// Design Name: 
// Module Name: sumOn7segTop_tb
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


module sumOn7segTop_tb;
    localparam N =3, W=16;
    logic clk=0, rstn=0, m_ready,m_valid,s_ready,s_valid;
    logic [W-1:0] s_data=8'd5;
    logic m_data [2][7] ;

    sumOn7segTop #(
                .W(W),
                .N(N)
                ) dut (
                .clk(clk),
                .rstn(rstn),
                .s_valid(s_valid),
                .s_ready(s_ready),
                .s_data(s_data),
                .m_valid(m_valid),
                .m_ready(m_ready),
                .m_data(m_data)
                );
    localparam CLK_PERIOD =10;
    initial forever //forever used in simulation 
        #(CLK_PERIOD/2) clk <=~clk;
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,dut);
        
        #(CLK_PERIOD *2)
        @(posedge clk)
        #1 rstn <=1; m_ready <=1; s_valid<=0;
        
        @(posedge clk);
        #1 s_valid<=1; s_data<= 8'd3; 
        @(posedge clk);
        #1 s_data<= 8'd2; 
        @(posedge clk);
        #1 s_data<= 8'd1; 
        @(posedge clk);
        #1  s_valid<=0; s_data<= 8'd1;
        #(CLK_PERIOD *2) 
        @(posedge clk);
        #1 s_valid<=1; s_data<= 8'd10; 
        @(posedge clk);
        #1 s_valid<=1; s_data<= 8'd7; 
        @(posedge clk);
        #1 s_valid<=1; s_data<= 8'd8; 
         #(CLK_PERIOD *2) 
                 @(posedge clk);
        #1 s_valid<=1; s_data<= 8'd4; 
        @(posedge clk);
        #1 s_valid<=1; s_data<= 8'd1; 
        @(posedge clk);
        #1 s_valid<=1; s_data<= 8'd4; 
                 #(CLK_PERIOD *10) 
        $finish();
    end
endmodule
