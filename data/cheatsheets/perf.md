# perf

Linux performance counters and profiling.

## Record & Report
```sh
perf record ./myapp                 # record profile
perf report                         # interactive TUI report
perf record -g ./myapp              # with call graph
perf record -F 99 ./myapp           # custom frequency (Hz)
perf record -p <pid>                # attach to process
```

## Quick Stats
```sh
perf stat ./myapp                   # summary (cycles, instructions, cache)
perf stat -e cache-misses ./myapp   # specific event
perf stat -r 5 ./myapp              # average over 5 runs
```

## Live Monitoring
```sh
perf top                            # system-wide live profile
perf top -p <pid>                   # single process
```

## Flamegraph (built-in)
```sh
perf script report flamegraph       # generate flamegraph
```

## Useful Events
```sh
perf list                           # list all events
perf record -e cache-misses ./myapp
perf record -e page-faults ./myapp
perf record -e branch-misses ./myapp
perf record -e context-switches ./myapp
```

## Annotate Source
```sh
perf annotate                       # assembly + source view
perf annotate -s myfunction         # specific function
```
