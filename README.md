# MiniLibC

MiniLibC is a project of x86-64 Assembly. The objective of this project is to create a dynamic ELF library to replace (to a certain extent) the standard C library you use every day on your system.
It allowed me to develop skills in :
- x86-64 processor and its instruction set
- memory and stack operation
- address spaces and function calling
- development of a mini-LibC in Assembly

## Usage

You'll need [make](https://www.gnu.org/software/make/) to compile the project.

```sh
$ git clone https://github.com/Nathn-G/asm_minilibc.git
$ cd asm_minilibc
$ make
$ make tests_run
```

After that you will be able to get libasm.so at the root of this project function added in lib.