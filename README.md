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
password, two at a time, until 1) both incoming password bytes are equal to 0
and the password is rejected, or 2) the accumulated 16-bit values are equal 
to some specific values, and the password is accepted.
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
After staring at the hashing algorithm and the required output values for
a while, I concluded that I don't know the required math for solving this
sort of equation. It's definitely easy, though, to test any given password
for acceptance. Impatient for a solution, I wrote a C program to test all
possible passwords of a given length. It didn't take long to conclude that
there are no 4-byte passwords. The next version of the program, on 5-byte
passwords revealed 18 solutions. Having solved the puzzle, I was then able
to view the Hall of Fame on the microcorruption site, and could verify
that the 5-byte solution is the shortest possible.

(Somewhat to my disappointment, none of the 5-byte passwords is a 
recognizable phrase; in fact, none consist only of printable characters. 
I think this is an oversight on the part of the puzzle designers.)

Adding to my shame at not being able to simply solve for the password with
math: the brute force search for 5-byte passwords takes about 12 hours
to run on my pretty-modern laptop.  Then I thought of a way to salvage
my dignity: I know how to design digital logic; I have access to programmable
logic hardware; why not build a custom computing machine to find the passwords?

## Hardware architecture
The idea is simple: run all possible passwords through a hash function, and
save the acceptable ones. The hashing function is tiny, so implement multiple
hashers on a chip, and split the password search space among them.

### Accelerator subsystem
#### Password generator
The password generator is fairly simple. Conceptually, it's a 40-bit
counter, which is parameterized to count within a subset of the full 40-bit
range. Because the hashing function operates on only 2 bytes at a time, I 
segmented the counter increment: the low 16 bits increment on one cycle;
the increment is propagated to the next 16 bits in the
next cycle, and finally up to the last 8 bites in the last of 3 cycles. 
Segmenting the incrementer in this way allows for a faster clock rate.

Partitioning of the password search space is provided by a pair of
parameters which specify the start and end values of the upper 8-bit
segment of the counter. With appropriate parameterization, the space can
be split into up to 256 partitions.

#### Hashing core function
Here's a sketch of the hashing function:

![alt text](https://github.com/aaronferrucci/hollywood_fpga_hash/blob/master/sketch.jpg "Back of envelope sketch")

The hashing function tests one 40-bit in 4 clock cycles. After a delay of
a further 2 cycles, the result (accept or reject) for the password is 
available; that value is passed back to the password generator (below).

#### Local memories
When the hashing function reports that a password was accepted, the password
generator stores it in a local memory. There's an irritating detail here:
I want to run passwords through the hashing function at full speed, but
the hashing function doesn't report results right away. In fact, the result
for password ```n``` isn't available until the middle of password ```n + 1```.
No problem: as each pair of password bytes is sent to the hasher, it's also
saved in a local memory. When the hasher reports acceptance, the write address 
is incremented to point to the next segment of memory; otherwise, the old value
is overwritten. An unavoidable quirk of this scheme is that the written value
is actually one greater than the accepted value. When reading results out, I 
adjust for this by subtracting one.

### Microprocessor subsystem
I use a low-performance, low-resource Nios2 microproccessor, with 64Kbytes
of ram, some LEDs, and a UART. The "local memories" written by the accelerator
subsystem are dual-port memories; the Nios2 reads results from the 2nd port.

## Results
The current revision has 32 hasher cores.  The hardware is a Max10 development 
board, with a 10M50DAF484C6GES device. I was able to clock the accelerator 
subsystem at 250MHz, and kept the Microproccessor subsystem running at a 
nice safe 50MHz since it's not in the critical path.

The system finds all 18 passwords in about 6 1/2 minutes. 
Compared to the software solution, that's a more than 100x speedup.

## Nuts and Bolts
I used Altera's free 16.0 Lite Edition for hardware development, and the
accompanying Nios2 Software Build Tools for Eclipse to develop the firmware.
The host computer for development is an Alienware laptop running Windows 10
(but working within the git bash shell wherever possible).

## Next steps
I've only filled my device about 30%, so I have room to increase the
number of hashing functions - at least doubling them. The design may
not scale easily though - at some point the connection from the Nios2 to
its many dual-port RAMs will be the bottleneck. Besides that, the Nios2
is a bit of a space hog - I'd rather use its logic for more hashing functions.
I have in mind a new version,  with no microprocessor, and a memory layout
which is more conducive to high-frequency operation. We shall see!

Another area to explore is to find some higher-performance hardware.
The Max10 family is definitely not the fastest or largest! I might be able
to squeeze another order of magnitude of improvement with a better FPGA.


