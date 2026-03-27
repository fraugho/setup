# cargo-flamegraph

One-command flamegraphs for Rust projects.

## Basic Usage
```sh
cargo flamegraph                    # profile release build
cargo flamegraph --dev              # profile debug build
cargo flamegraph -- arg1 arg2       # pass args to binary
cargo flamegraph --bin mybin        # specific binary
cargo flamegraph --test test_name   # profile a test
cargo flamegraph --bench bench_name # profile a benchmark
```

## Output
```sh
cargo flamegraph -o my.svg          # custom output file
cargo flamegraph --notes "run 1"    # add notes to svg
```

## Options
```sh
cargo flamegraph --root             # run as root (no sudo prompt)
cargo flamegraph --freq 5000        # sampling frequency (Hz)
cargo flamegraph --flamechart       # time-ordered (not merged)
```

## Tips
- Opens `flamegraph.svg` in browser automatically
- Red = on-CPU time, wider = more time
- Click to zoom into a stack frame
- Needs `perf` installed (already in packages)
- Use `--release` profile for realistic results
