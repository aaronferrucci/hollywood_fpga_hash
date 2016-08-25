# hollywood_fpga_hash
Custom hardware to compute a hash function.

Here's a sketch of the core engine:

![alt text](https://github.com/aaronferrucci/hollywood_fpga_hash/blob/master/sketch.jpg "Back of envelope sketch")

This is rev1: nios2-equipped design, 32 hasher cores. Firmware stops hashers,
clears memory, starts hashers, polls for completion, prints results.

