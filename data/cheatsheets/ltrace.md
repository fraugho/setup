# ltrace

Trace library calls (libc, etc).

## Basic Usage
```sh
ltrace ./myapp                  # trace all library calls
ltrace -p <pid>                 # attach to running process
ltrace -o output.txt ./myapp    # save to file
```

## Filtering
```sh
ltrace -e malloc+free ./myapp   # only malloc/free
ltrace -e printf ./myapp        # only printf calls
ltrace -l libc.so.6 ./myapp     # calls to specific library
```

## Output
```sh
ltrace -c ./myapp               # summary/count of calls
ltrace -c -S time ./myapp       # sort by time spent
ltrace -n 4 ./myapp             # indent nested calls
ltrace -s 200 ./myapp           # longer string output
```

## Combined with strace
```sh
ltrace -S ./myapp               # show syscalls too
```
