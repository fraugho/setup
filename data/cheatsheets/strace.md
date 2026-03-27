# strace

Trace system calls and signals.

## Basic Usage
```sh
strace ./myapp                  # trace all syscalls
strace -p <pid>                 # attach to running process
strace -o output.txt ./myapp    # save to file
```

## Filtering
```sh
strace -e open,read,write ./myapp   # specific syscalls
strace -e trace=network ./myapp     # network calls only
strace -e trace=file ./myapp        # file operations only
strace -e trace=memory ./myapp      # memory operations
strace -e trace=process ./myapp     # fork/exec/exit
```

## Timing
```sh
strace -T ./myapp               # time spent in each syscall
strace -t ./myapp               # timestamp each call
strace -c ./myapp               # summary/count of calls
strace -c -S time ./myapp       # sort summary by time
```

## Useful Flags
```sh
strace -f ./myapp               # follow child processes
strace -s 1024 ./myapp          # show more string data (default 32)
strace -y ./myapp               # show file paths for fds
```
