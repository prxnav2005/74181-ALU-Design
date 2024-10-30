module CLA_four_bit(
    input logic [3:0] A, B,
    input logic Cin,
    output logic [3:0] S,
    output logic Cout
);
    logic [3:0] G, P;
    logic [4:0] C;

    assign G[0] = A[0] & B[0];
    assign G[1] = A[1] & B[1];
    assign G[2] = A[2] & B[2];
    assign G[3] = A[3] & B[3];

    assign P[0] = A[0] | B[0];
    assign P[1] = A[1] | B[1];
    assign P[2] = A[2] | B[2];
    assign P[3] = A[3] | B[3];
    
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & Cin);
    assign C[2] = G[1] | (P[1] & (G[0] | (P[0] & Cin)));
    assign C[3] = G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & Cin)))));
    assign Cout = G[3] | (P[3] & (G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & Cin)))))));

    assign S[0] = A[0] ^ B[0] ^ C[0];
    assign S[1] = A[1] ^ B[1] ^ C[1];
    assign S[2] = A[2] ^ B[2] ^ C[2];
    assign S[3] = A[3] ^ B[3] ^ C[3];
   
endmodule

module alu(
    input [3:0] A, B,
    input [3:0] ALU_Sel,
    output [3:0] ALU_Out,
    output CarryOut
);
    reg [3:0] ALU_Result;
    wire [3:0] sum;
    wire cout;

    CLA_four_bit cla_adder (A, B, 1'b0, sum, cout);

    assign ALU_Out = ALU_Result;
    assign CarryOut = cout;

    always @(*)
    begin
        case(ALU_Sel)
            4'b0000: ALU_Result = sum;
            4'b0001: ALU_Result = A - B;
            4'b0010: ALU_Result = A * B;
            4'b0011: ALU_Result = A / B;
            4'b0100: ALU_Result = A << 1;
            4'b0101: ALU_Result = A >> 1;
            4'b0110: ALU_Result = {A[2:0], A[3]};
            4'b0111: ALU_Result = {A[0], A[3:1]};
            4'b1000: ALU_Result = A & B;
            4'b1001: ALU_Result = A | B;
            4'b1010: ALU_Result = A ^ B;
            4'b1011: ALU_Result = ~(A | B);
            4'b1100: ALU_Result = ~(A & B);
            4'b1101: ALU_Result = ~(A ^ B);
            4'b1110: ALU_Result = (A > B) ? 4'd1 : 4'd0;
            4'b1111: ALU_Result = (A == B) ? 4'd1 : 4'd0;
            default: ALU_Result = sum;
        endcase
    end
endmodule