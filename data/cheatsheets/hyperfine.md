# hyperfine

CLI benchmarking tool.

## Basic
```sh
hyperfine './myapp'                       # benchmark command
hyperfine --warmup 3 './myapp'            # 3 warmup runs first
hyperfine --min-runs 20 './myapp'         # at least 20 runs
```

## Compare Commands
```sh
hyperfine './old' './new'                 # A vs B comparison
hyperfine 'rg pattern' 'grep -r pattern' # tool comparison
hyperfine './build-debug' './build-release' --labels debug,release
```

## Options
```sh
hyperfine --prepare 'make clean' './build'  # setup before each
hyperfine --cleanup 'rm -rf out' './build'  # cleanup after each
hyperfine --shell=none './myapp'            # skip shell overhead
hyperfine --export-markdown bench.md './a'  # markdown output
hyperfine --export-json bench.json './a'    # json output
```

## Parameter Sweeps
```sh
hyperfine -P threads 1 8 './myapp -t {threads}'  # vary parameter
hyperfine -L compiler gcc,clang '{compiler} -O2 main.c && ./a.out'
```
