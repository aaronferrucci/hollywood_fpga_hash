# hollywood_fpga_hash
Brute-force hash function inversion in a cheap FPGA.

## Spoiler alert!
This project implements a brute force solution to a sub-problem of the final 
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
sort of puzzle. It's definitely easy, though, to test any given password
for acceptance. Impatient for a solution, I wrote a C program to test all
possible passwords of a given length. It didn't take long to prove that
there are no 4-byte passwords. The next version of the program, on 5-byte
passwords, revealed 18 solutions (after running overnight). Having solved the 
puzzle, I was then able to view the Hall of Fame on the microcorruption 
site, and could verify that the 5-byte solution is the shortest possible.

(To my disappointment, none of the 5-byte passwords is a 
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
This component generates candidate passwords in sequential order. 
Conceptually, the password generator is just a 40-bit
counter. Because the hashing 
function only consumes 2 bytes at a time - not a full 40 bit password - the
password generator is pipelined: the low 16 bits increment on one cycle;
the increment is propagated to the next 16 bits in the
next cycle, and the last 8 bits of the counter increment in the last of 3
cycles. Segmenting the incrementer in this way allows for a faster clock rate.

The password generator component has a
pair of parameters which specify the start
and end values of the upper 8-bit segment of the counter.
The goal is to partition the password search space by instantiating
multiple password generators, each parameterized to work on a subset of the
space.  For example, if there are 4 password generators, they'd be
parameterized with (start, end) values {(0, 0x3F), (0x40, 0x7F), (0x80, 0xBF), (0xC0, 0xFF)}.

#### Hashing core function
Here's a sketch of the hashing function:

![alt text](https://github.com/aaronferrucci/hollywood_fpga_hash/blob/master/sketch.jpg "Back of envelope sketch")

The hashing function tests one 40-bit in 4 clock cycles. After a delay of
a further 2 cycles, the result (accept or reject) for the password is 
available; that result is passed back to the password generator.

#### Local memories
When the hashing function reports that a password was accepted, the password
generator stores it in a local memory. There's an irritating detail here:
I want to run passwords through the hashing function at full speed, but
the hashing function doesn't report results right away. In fact, the result
for password ```n``` isn't available until the middle of password ```n + 1```.
No problem: as each pair of password bytes is sent to the hasher, it's also
saved in a local memory. When the hasher reports acceptance, the write address 
is incremented to point to the next segment of memory; otherwise, the previous
value is overwritten. An unavoidable quirk of this scheme is that the 
written value is actually one greater than the accepted value. When reading
results out, I 
adjust for this by subtracting one. Another quirk caused by this
overwrite-and-update scheme is that non-accepted password values will be
present in the local memories - for example, the final count value. These
bogus values are eliminated in software as the results are collected.

### Microprocessor subsystem
I use a low-performance, low-resource Nios2 microproccessor, with 64Kbytes
of ram, some LEDs, and a UART. The "local memories" written by the accelerator
subsystem are dual-port memories; the Nios2 reads results from the 2nd port.

## Simulation Testing
The custom components which comprise the accelerator subsystem - hashing
function, password generator - are not so complex, but nonetheless it's
useful to debug them in isolation. Simulation testbenches for both components,
with simple test programs to stimulate activity are provided. To run the
simulations, do ```make SYS=test_core``` or ```make SYS=test_pw_gen```. In
either case, a test system containing the device to test is generated, then
the generated logic, testbench, and hand-written test program are compiled
in Modelsim. Finally, the simulation runs and brings up wave window for 
visual inspection.

## Results
The current revision has 32 hasher cores. The hardware is a Max10 development 
board, with a 10M50DAF484C6GES device. I was able to clock the accelerator 
subsystem at 275MHz, and kept the Microproccessor subsystem running at a 
nice safe 50MHz since it's not in the critical path.

The system finds all 18 passwords in about 5 1/4 minutes. 
Compared to the software solution, that's about a 138x speedup.

## Nuts and Bolts
I used Altera's free 16.0 Lite Edition for hardware development, and the
accompanying Nios2 Software Build Tools for Eclipse to develop the firmware.
Simulation is done with the included free version of Modelsim. I used the Max
10 FPGA Development Kit for hardware execution.

The design hierarchy looks like this:
* Quartus project with simple Verilog top level
  * Qsys system
    * Microprocessor subsystem
      * multiple local memories - microprocessor subsystem side
    * Accelerator subsystem
      * multiple (password generators/hashing function) instances
      * multiple local memories - accelerator subsystem side

Design flow:
TODO: do all this in a Makefile! For now, here are the manual steps:

1.  The qsys system is implemented as a tcl script to allow the number of
     hashing functions/password generators to be parameterized. Generate it as
     ```qsys-script --script=hollywood_hash.tcl```
1.  open Quartus, and open hollywood_hash.qsys in the Qsys editor
1.  in the Qsys gui, do "Generate HDL.../Generate"
1.  compile the design in Quartus
1.  turn on the Max10 board
1.  open output_files/Chain.cdf in the Quartus Programmer, program the device
1.  open the niosII ide
1.  generate the hash_driver_bsp NiosII bsp
1.  compile the hash_driver app
1.  set up the hash_driver run config
1.  run the hash_driver run config, observe the results in the console

## Next steps

### Performance Boost
A speedup of 138x (relative to my laptop) is ok, considering that
* waiting 5.25 minutes for results is far better on a human psychology level
  than 12 hours
* the accelerator hardware platform consumes much less power than a full-blown
  computer

Nonetheless, I think I've only scratched the surface. Here are some ideas 
for improving the speedup, ranked in increasing difficulty.

1. The hashing function logic delivers one result every four cycles. The fourth
cycle is used just for resetting the accumulated r4 and r6 values. It's
probably not too difficul to eliminate that fourth cycle, for a 33% speedup,
at the cost of 32 register bits to save the final computed value, plus a bit
of random logic. Additional savings would occur in the password generator: it
drives the fourth cycle reset event on the hashing function, and would no
longer need to do that.
1. One password generator is used for each hashing function core, but the
password generators differ only in the upper 8 bits of the 40-bit counter.
Seems like I can use just one password generator, and stub in the top 8-bits
on a per-hashing function basis. In other words, move the password search
space parameter(s) into the hashing function, and use just one password
generator. N.b. the store-to-memory value would also need the upper-8-bit
modification...
1. Another area to explore is to find some higher-performance hardware.
The Max10 family is definitely not the fastest or largest! I might be able
to squeeze out another order of magnitude of improvement with a better FPGA.
1. I've only filled my device about 24%, so I have room to increase the
number of hashing functions - at least doubling them. The design may
not scale easily though - at some point the connection from the Nios2 to
its many dual-port RAMs will be the bottleneck. Also, due to memory
granularity, it might not be possible to increase the number of local 
memories. Besides that, the Nios2 is a bit of a space hog - I'd rather 
use its logic for more hashing functions.  I have in mind a new version, 
with no microprocessor, and a memory subsystem which is more scalable, and
conducive to high-frequency operation. We shall see!

### Easter Egg Hunt
None of the 18 minimal-length (5 byte) passwords is made up of all printable
characters. Too bad; I think that would have been fun - an easter egg of 
sorts. It is possible that somewhere out there in the space of all possible 
passwords, there is a printable password. A slightly different accelerator 
could search for printable passwords.

