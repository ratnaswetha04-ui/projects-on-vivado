`timescale 1ns/1ps

module tb_ripple_carry_adder;
    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    ripple_carry_adder uut(
        .a(a), .b(b), .cin(cin),
        .sum(sum), .cout(cout)
    );

    initial begin
     
        a = 4'b0011; b = 4'b0100; cin = 0; #20;
        a = 4'b0111; b = 4'b1000; cin = 0; #20;
        a = 4'b1111; b = 4'b0001; cin = 0; #20;
        a = 4'b0101; b = 4'b0101; cin = 1; #20;
        
        $finish;
    end

    initial begin
        $monitor("a=%b b=%b cin=%b | sum=%b cout=%b | decimal: %0d+%0d=%0d",
                  a, b, cin, sum, cout, a, b, {cout,sum});
    end

endmodule
