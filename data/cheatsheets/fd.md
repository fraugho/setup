# fd

Simple, fast alternative to find.

## Basic
```sh
fd                               # list all files
fd "pattern"                     # find by name (regex)
fd -g "*.rs"                     # glob pattern
fd -F "exact_name"              # exact filename
```

## Filter
```sh
fd -e rs                         # by extension
fd -e rs -e toml                 # multiple extensions
fd -t f                          # files only
fd -t d                          # directories only
fd -t l                          # symlinks only
fd -H                            # include hidden
fd -I                            # include ignored (.gitignore)
```

## Depth & Path
```sh
fd -d 2 "pattern"               # max depth 2
fd "pattern" /path/to/search    # search specific dir
fd -p "src/.*test"              # match full path
```

## Execute
```sh
fd -e rs -x wc -l               # run command on each
fd -e rs -X bat                  # run command on all at once
fd -e tmp -x rm                  # delete all .tmp files
```

## Useful Combos
```sh
fd -e rs | fzf                   # fuzzy find Rust files
fd -t d | fzf | cd              # fuzzy cd
fd -e c -x clang-format -i      # format all C files
```
