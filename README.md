# Project Euler Solutions
## About
This repo was created for educational purposes. It serves as a collection for the various solutions to the problems presented in [Project Euler](https://projecteuler.net/). The idea is to have each programmer specialize in answering the problems in a programming language they arent used to and to have others who are more proficient help them out when they are stuck. Each problem will be housed in its own folder where every contributor submits a solution in their language of choice. 
### The Contributors:
- [Milan Capoor](https://github.com/mcapoor) - C
- [Andrew Friedman](https://github.com/Fried-man) - ARM Assembly
- [Zach Lloyd](https://github.com/zachlloyd01) - C#
- [Pedro Victor](https://github.com/PedroVictorCoding) - Python
## How to Use the Code
### ARM Assembly
ARM is a 32-bit architecture that has a simple goal in mind: flexibility. While this is great for integrators (as they have a lot of freedom when designing their hardware) it is not so good for system developers which have to cope with the differences in the ARM hardware. The ARM Assembly code in this repo was written for the Raspberry Pi Model B+ running Raspbian. Below are terminal commands useful for writing, testing, and running our solution.s files.
#### For General:
* `vim <program_name.s>` opens vim text editor for program
#### For Compiling:
* `as -g -o <program_name>.o <program_name>.s` assembles assembly code
* `ld -o <program_name> <program_name>.o` makes executable
#### For Debugging:
* `gdb <program_name>` starts debugger
* `list` shows next 10 lines of code
* `b <line_number>` sets breakpoint at <line_number>
* `run` runs program until breakpoint or exit
* `info r` gets info on all registers
