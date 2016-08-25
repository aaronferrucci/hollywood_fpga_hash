# hollywood_fpga_hash
Custom hardware to compute a hash function.

## Spoiler alert!
This projects implements a brute force solution to a sub-problem of the final 
level of [microcorruption](http://www.microcorruption.com). I avoid a detailed
description of that final level, but inevitably some spoilers will leak out.
If you don't want to be tainted, stop reading now!

## The problem
Every level of microcorruption is solved with an accepted password. 
In the earliest levels, that password might be available by simple inspection
of the code. Later levels are more complicated - the password exploits bugs 
in the code, to corrupt the heap, modify instructions, etc.

The final level is a celebration of obfuscated code, but when the actual
password accepting code is revealed, it's conceptually simple: the
password is run through a simple hashing algorithm, 2 bytes at a time, and
is accepted when the hashed output matches given constant values.

## The hash algorithm
Two 16-bit values are initialized to 0, and then updated with bytes of the
password, two at a time, until 1) the password bytes are equal to 0 (both
bytes), 2) the accumulated 16-bit values are equal to some specific values.
Pseudocode:
```
r4 = 0
r6 = 0
loop:
  pw = get next 2 password bytes
  if pw == 0
    reject
  r4' = r6 ^ swapb(pw)
  r6' = swapb(r4 + swapb(pw))
  r4 = r4'
  r6 = r6'
  if r4 == 0xfeb1 && r6 == 0x9298
    accept
  goto loop
```

## Brute force software solution
## Hardware architecture
Here's a sketch of the core engine:

![alt text](https://github.com/aaronferrucci/hollywood_fpga_hash/blob/master/sketch.jpg "Back of envelope sketch")

## Results
This is rev1: nios2-equipped design, 32 hasher cores. Firmware stops hashers,
clears memory, starts hashers, polls for completion, prints results.


