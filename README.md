# Project Euler Solutions
## About
This repo was created for educational purposes. It serves as a collection for the various solutions to the problems presented in [Project Euler](https://projecteuler.net/). The idea is to have each programmer specialize in answering the problems in a programming language they arent used to and to have others who are more proficient help them out when they are stuck. Each problem will be housed in its own folder where every contributor submits a solution in their language of choice. 
### The Contributors:
- [Milan Capoor](https://github.com/mcapoor) - C
- [Andrew Friedman](https://github.com/Fried-man) - ARM Assembly
- [Zach Lloyd](https://github.com/zachlloyd01) - C#
- [Pedro Victor](https://github.com/PedroVictorCoding) - Python
## How to Use the Code
### General:
* Each program can be opened in a variety of text editors or development envirnoments
* By agreement among the contributors to this project, and for the sake of flexibility, Vim is our editor of choice.
* The command `vim Solution.<s/c/py/cs/lisp>` from within the directory of the desired program will open the file.
* All commands are assumed to be run within the directory of the desired file unless otherwise specified.
### ARM Assembly
ARM is a 32-bit architecture that has a simple goal in mind: flexibility. While this is great for integrators (as they have a lot of freedom when designing their hardware) it is not so good for system developers which have to cope with the differences in the ARM hardware. The ARM Assembly code in this repo was written for the Raspberry Pi Model B+ running Raspbian. Below are terminal commands useful for writing, testing, and running our `Solution.s` files.
#### For Compiling:
* `as -g -o <program_name>.o <program_name>.s` assembles assembly code
* `ld -o <program_name> <program_name>.o` makes executable
#### For Debugging:
* `gdb <program_name>` starts debugger
* `list` shows next 10 lines of code
* `b <line_number>` sets breakpoint at <line_number>
* `run` runs program until breakpoint or exit
* `info r` gets info on all registers
### C
C is a general-purpose, procedural computer programming language. By design, C provides constructs that map efficiently to typical machine instructions and has found lasting use in applications previously coded in assembly language. Such applications include operating systems and various application software for computers, from supercomputers to embedded systems. It was originally developed at Bell Labs by Dennis Ritchie. Later, it was applied to re-implementing the kernel of the Unix operating system and a huge variety of other projects. Nowadays, it is one of the most widely used programming languages, with C compilers from various vendors available for the majority of existing computer architectures and operating systems. Below are some of the necessary commands to run our `Solution.c` files.
#### For Compiling:
* `gcc Solution.c -o Solution` compiles the code into an executable called `Solution`
* `"/path/to/file/"Solution` runs the executable
