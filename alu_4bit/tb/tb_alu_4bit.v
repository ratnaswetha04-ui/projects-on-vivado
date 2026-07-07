`timescale 1ns/1ps

module tb_alu_4bit;
    reg  [3:0] a, b;
    reg  [2:0] op;
    wire [3:0] result;
    wire       zero;

    alu_4bit uut(.a(a), .b(b), .op(op), .result(result), .zero(zero));

    initial begin
        // ADD: 4+3=7
        a=4'd4;  b=4'd3;  op=3'b000; #20;
        // SUB: 7-3=4
        a=4'd7;  b=4'd3;  op=3'b001; #20;
        // AND: 1100 & 1010 = 1000
        a=4'b1100; b=4'b1010; op=3'b010; #20;
        // OR: 1100 | 1010 = 1110
        a=4'b1100; b=4'b1010; op=3'b011; #20;
        // XOR: 1100 ^ 1010 = 0110
        a=4'b1100; b=4'b1010; op=3'b100; #20;
        // NOT: ~1100 = 0011
        a=4'b1100; b=4'b0000; op=3'b101; #20;
        // Left Shift: 0001 << 1 = 0010
        a=4'b0001; b=4'b0000; op=3'b110; #20;
        // Right Shift: 1000 >> 1 = 0100
        a=4'b1000; b=4'b0000; op=3'b111; #20;
        // Zero flag test: 4-4=0
        a=4'd4;  b=4'd4;  op=3'b001; #20;

        $finish;
    end

    initial begin
        $monitor("op=%b a=%b b=%b | result=%b (%0d) zero=%b",
                  op, a, b, result, result, zero);
    end

endmodule
