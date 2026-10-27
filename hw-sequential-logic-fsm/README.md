# Sequential logic and FSM homework

Three Verilog problems, each with a self-checking testbench that compares against a reference model. No AI used. Also run on the Basys3 board.

- **p2_flipflops**: a JK flip-flop built from a D flip-flop plus gates, then a D and a T flip-flop built from that JK. The testbench checks all three over 10 steps and reports ALL TESTS PASSED.
- **p3_gray_counter**: a 3-bit Moore state machine stepping 000, 001, 011, 010, 110, 111, 101, 100 with a synchronous reset. The testbench runs two full laps, checks that one bit changes per step, and tests a mid-lap reset.
- **p4_fsm**: a Mealy machine with inputs A and B and output Z. Z is A AND the previous A when B is 0, and A OR the previous A when B is 1. Reduced to one state bit, Z = majority of the state, A and B.
