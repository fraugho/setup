# dust

Visual disk usage (better du).

## Basic
```sh
dust                             # current directory
dust /path                       # specific path
dust ~                           # home directory
```

## Options
```sh
dust -n 20                       # show top 20 (default 21)
dust -d 3                        # max depth 3
dust -r                          # reverse order
dust -s                          # use apparent size (not disk)
dust -b                          # no percent bars
dust -f                          # show filecount instead of size
```

## Ignore
```sh
dust -X .git                     # ignore .git directory
dust -X node_modules             # ignore node_modules
```
