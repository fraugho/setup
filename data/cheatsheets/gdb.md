# gdb

GNU debugger.

## Start
```sh
gdb ./myapp                 # start debugger
gdb ./myapp core             # debug core dump
gdb -p <pid>                 # attach to process
```

## Breakpoints
```
b main                       # break at function
b file.c:42                  # break at line
b file.c:42 if x > 5        # conditional break
watch var                    # break when var changes
info b                       # list breakpoints
d 1                          # delete breakpoint 1
```

## Running
```
r                            # run
r arg1 arg2                  # run with args
c                            # continue
n                            # next (step over)
s                            # step (step into)
fin                          # finish current function
```

## Inspect
```
p var                        # print variable
p *ptr                       # dereference pointer
p/x var                      # print hex
p sizeof(struct)             # size of type
bt                           # backtrace
bt full                      # backtrace with locals
info locals                  # all local variables
info args                    # function arguments
```

## Memory
```
x/10x ptr                   # 10 hex words at ptr
x/s str                     # print string at addr
info proc mappings           # memory map
```

## TUI Mode
```
tui enable                   # split screen source view
layout src                   # source layout
layout asm                   # assembly layout
layout split                 # both
```
