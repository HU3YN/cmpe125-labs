# Lab 3: hex to seven-segment decoder

Four switches pick a digit from 0 to F and the display shows it. Segments are active low, and C is shown as a lowercase c by design.

I built a truth table, then a K-map for each segment, then wrote the sum-of-products equations in Verilog. The testbench steps through all 16 inputs at 100 ns each.

Fix on the board: all four displays first showed the same digit. Enabling only digit 0 (anode low) and switching the other three off (anodes high) fixed it.
