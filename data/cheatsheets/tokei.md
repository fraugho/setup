# tokei

Count lines of code by language.

## Basic
```sh
tokei                            # current directory
tokei /path/to/project           # specific path
tokei src/                       # subdirectory
```

## Options
```sh
tokei -e tests                   # exclude directory
tokei -t Rust,Go                 # specific languages only
tokei -s lines                   # sort by lines
tokei -s code                    # sort by code lines
tokei -s blanks                  # sort by blank lines
tokei -s comments                # sort by comments
```

## Output
```sh
tokei -o json                    # JSON output
tokei -o json | jq               # pipe to jq
tokei -f                         # show individual files
```
