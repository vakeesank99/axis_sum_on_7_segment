`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2023 07:20:08 PM
// Design Name: 
// Module Name: sumOn7segConv_tb
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


module sumOn7segConv_tb;
    localparam W=16;
    logic [W-1:0] s_data;
    logic m_data [2][7];
    
    sumOn7segConv#(.W(W)) dut(
                .s_data(s_data),
                .m_data(m_data)
    );
    
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,dut);

        #1 s_data=16'd79;
        #10
        $finish();
    end
endmodule
