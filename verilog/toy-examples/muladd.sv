module muladd(
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    output [3:0] out
);
    assign out = (a * b) + c;
endmodule