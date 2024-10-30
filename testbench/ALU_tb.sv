module tb_alu;
    reg [3:0] A, B;
    reg [3:0] ALU_Sel;
    wire [3:0] ALU_Out;
    wire CarryOut;

    alu test_unit (
        A,
        B,
        ALU_Sel,
        ALU_Out,
        CarryOut
    );

    initial begin
        A = 4'hA;
        B = 4'h2;
        ALU_Sel = 4'h0;
        #10;

        ALU_Sel = 4'h1;
        #10;

        ALU_Sel = 4'h2;
        #10;

        ALU_Sel = 4'h3;
        #10;

        ALU_Sel = 4'h4;
        #10;

        ALU_Sel = 4'h5;
        #10;

        ALU_Sel = 4'h6;
        #10;

        ALU_Sel = 4'h7;
        #10;

        ALU_Sel = 4'h8;
        #10;

        ALU_Sel = 4'h9;
        #10;

        ALU_Sel = 4'hA;
        #10;

        ALU_Sel = 4'hB;
        #10;

        ALU_Sel = 4'hC;
        #10;

        ALU_Sel = 4'hD;
        #10;

        ALU_Sel = 4'hE;
        #10;

        ALU_Sel = 4'hF;
        #10;

        A = 4'hF;
        B = 4'hA;
        ALU_Sel = 4'h0;
        #10;
    end
endmodule