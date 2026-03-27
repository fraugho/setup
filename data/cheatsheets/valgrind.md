# valgrind

Memory error detection and profiling.

## Memory Errors (Memcheck)
```sh
valgrind ./myapp                    # basic memory check
valgrind --leak-check=full ./myapp  # detailed leak report
valgrind --track-origins=yes ./myapp # trace uninit values
valgrind --show-reachable=yes ./myapp # show all leaks
```

## Heap Profiling (Massif)
```sh
valgrind --tool=massif ./myapp      # heap profile
ms_print massif.out.<pid>           # view results
```

## Cache Profiling (Cachegrind)
```sh
valgrind --tool=cachegrind ./myapp  # cache miss analysis
cg_annotate cachegrind.out.<pid>    # view annotated source
```

## Callgrind (call graph)
```sh
valgrind --tool=callgrind ./myapp
callgrind_annotate callgrind.out.<pid>
kcachegrind callgrind.out.<pid>     # GUI viewer
```

## Tips
- Compile with `-g` for line numbers
- ~20x slower than normal execution
- Suppressions: `--gen-suppressions=all`
