`timescale 1ns/10ps

module inv(A, Y);
    input A;
    input Y;

    assign Y = ~A;
endmodule