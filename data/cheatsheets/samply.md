# samply

Sampling profiler - opens results in Firefox Profiler UI.

## Basic Usage
```sh
samply record ./myapp               # profile any binary
samply record cargo run --release   # profile Rust project
samply record -- ./myapp arg1 arg2  # with arguments
```

## Options
```sh
samply record -r 10000 ./myapp      # sample rate (Hz)
samply record -p <pid>              # attach to process
samply record --save-only profile.json ./myapp  # save, don't open
```

## View Saved Profile
```sh
samply load profile.json            # open in browser
```

## What It Shows
- Call tree with time percentages
- Flame graph view
- Timeline of samples
- Source code annotation
- Markers and categories

## Tips
- Compile with `-g` (debug info) for source mapping
- Works with C, C++, Rust, or any native binary
- Uses Firefox Profiler UI (runs locally, no upload)
- Much nicer UI than perf report
