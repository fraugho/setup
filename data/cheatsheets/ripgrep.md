# ripgrep (rg)

Fast grep replacement. Respects .gitignore.

## Basic Search
```sh
rg "pattern"                     # search current dir recursively
rg "pattern" path/               # search specific path
rg -i "pattern"                  # case insensitive
rg -w "word"                     # whole word only
rg -F "literal.string"           # no regex, literal match
```

## Filter Files
```sh
rg -t rust "pattern"             # only Rust files
rg -t py "pattern"               # only Python files
rg -g "*.toml" "pattern"         # glob filter
rg --hidden "pattern"            # include hidden files
rg -u "pattern"                  # include ignored files
rg -uu "pattern"                 # include hidden + ignored
```

## Output
```sh
rg -l "pattern"                  # file names only
rg -c "pattern"                  # count per file
rg -n "pattern"                  # line numbers (default)
rg -C 3 "pattern"               # 3 lines context
rg -B 2 -A 2 "pattern"          # before/after context
```

## Replace
```sh
rg "old" -r "new"               # preview replacement
rg "old" -r "new" -l | xargs sed -i 's/old/new/g'  # apply
```

## Regex
```sh
rg "fn \w+\("                   # function definitions
rg "TODO|FIXME|HACK"            # multiple patterns
rg "log.*error" -i              # combined
```
