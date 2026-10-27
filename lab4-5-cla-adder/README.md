# Labs 4 and 5: 4-bit carry-lookahead adder

Nine switches set A, B and the carry in. LEDs show the 4-bit sum, carry out, group propagate and group generate.

Each bit gets a generate signal (A AND B) and a propagate signal (A XOR B) from a small full-adder module (`GPFullAdder`). A separate block (`CLALogic`) computes every carry directly from those signals and the carry in, so carries do not ripple through the bits. I worked out the logic by hand first with truth tables and K-maps.

## Testing
- Lab 4: two directed cases in simulation (4+5=9 and 9+11+carry 1=21), also run on the board.
- Lab 5: a self-checking testbench and a vector-file testbench that reads `test_vectors.tv` and counts mismatches. The vector run reported 4 tests with 0 errors.
- I also checked all 512 combinations of A, B and carry in separately, and every sum, carry out, group propagate and group generate came out right.

## Limits
4 bits only. The lab's own testbenches used a few directed cases.

The Lab 5 testbench sources are not yet in this folder.
