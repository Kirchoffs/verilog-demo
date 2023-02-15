# Notes

## Structural & Behavioral Representation
In Verilog HDL, there are two main ways to represent a digital circuit: structural and behavioral.

Structural representation describes the circuit in terms of its physical components, such as gates, flip-flops, and other modules. The structural code specifies how these components are connected together to form a larger circuit. This type of representation is often used to describe circuits that are already well understood and have a fixed structure, such as adders or multiplexers.

Behavioral representation, on the other hand, describes the circuit in terms of its behavior, or the way it operates. This type of code focuses on the input/output behavior of the circuit, without specifying the internal components that make it up. Behavioral representation is often used when the circuit is complex and the internal structure is less important.

In practice, most digital circuits are designed using a combination of both structural and behavioral representations. The choice of representation depends on the specific requirements of the circuit, as well as the design style and preferences of the designer.

## Continuous Assignment
Whenever any signal on the right-hand side changes its state, the value of f will be re-evaluated.
```
assign f = (~s & x1) | (s & x2);
```

## Procedural Statement
Verilog syntax requires that procedural statements be contained inside a construct called an always block.  

An important property of the always block is that the statements it contains are evaluated in the order given in the code. This is in contrast to the continuous assignment statements, which are evaluated concurrently and hence have no meaningful order.  

The part of the always block after the @ symbol, in parentheses, is called the sensitivity list. This list has its roots in the use of Verilog for simulation. To simplify it, you can just use `always @(*)` or `always @*`.

The statements inside an always block are executed by the simulator only when one or more of the signals in the sensitivity list changes value. In this way, the complexity of a simulation process is simplified, because it is not necessary to execute every statement in the code at all times.

If a signal is assigned a value using procedural statements, then Verilog syntax requires that it be declared as a variable; this is accomplished by using the keyword reg (register).
### Demo
```
module multiplexer_behavioral(x1, x2, s, f);
    input x1, x2, s;
    output f;               // or just `output reg f;`
    reg f;

    always @(x1 or x2 or s) // or just always @(x1, x2, s)
        if (s == 0) {
            f = x1;
        } else {
            f = x2;
        }
endmodule
```