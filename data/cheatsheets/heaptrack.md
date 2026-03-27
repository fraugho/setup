# heaptrack

Heap memory profiler - find where memory is allocated.

## Record
```sh
heaptrack ./myapp               # profile from start
heaptrack -p <pid>              # attach to running process
```

## Analyze
```sh
heaptrack_print heaptrack.myapp.<pid>.zst   # text summary
heaptrack_gui heaptrack.myapp.<pid>.zst     # GUI (if installed)
```

## What It Shows
- Peak heap usage
- Total allocations
- Allocation hotspots (which function allocates most)
- Memory leaks (allocated but never freed)
- Allocation flamegraph

## Tips
- Much faster than valgrind massif
- Compile with `-g` for source line info
- Output files can be large - uses zstd compression
