# git-delta

Beautiful syntax-highlighted git diffs.

## Setup (add to ~/.gitconfig)
```ini
[core]
    pager = delta
[interactive]
    diffFilter = delta --color-only
[delta]
    navigate = true
    side-by-side = true
    line-numbers = true
```

## Then Just Use Git Normally
```sh
git diff                         # delta renders automatically
git show                         # same
git log -p                       # same
git blame                        # same
```

## Navigation (in pager)
```
n/N                              # next/prev file (with navigate=true)
q                                # quit
/pattern                         # search
```

## Options
```sh
delta --side-by-side             # side by side view
delta --line-numbers             # show line numbers
delta --diff-so-fancy            # emulate diff-so-fancy style
delta --syntax-theme ansi        # theme (ansi, Dracula, Nord, etc)
```

## Standalone (without git)
```sh
delta file_a file_b              # diff two files
diff -u old new | delta          # pipe any diff
```
