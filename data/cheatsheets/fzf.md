# fzf

Fuzzy finder for everything.

## Basic
```sh
fzf                              # fuzzy find files
cat file | fzf                   # fuzzy filter any input
```

## Shell Integration (auto-enabled)
```
ctrl+r                           # fuzzy search command history
ctrl+t                           # fuzzy find file, insert path
alt+c                            # fuzzy cd into directory
```

## With Other Tools
```sh
nvim $(fzf)                      # open file in neovim
cd $(find . -type d | fzf)       # cd into dir
kill -9 $(ps aux | fzf | awk '{print $2}')  # kill process
git checkout $(git branch | fzf) # switch branch
```

## Search Syntax
```
abc      # fuzzy match "abc"
^abc     # starts with "abc"
abc$     # ends with "abc"
'abc     # exact match "abc"
!abc     # does not match "abc"
```

## Options
```sh
fzf --preview 'bat {}'           # preview with syntax highlight
fzf -m                           # multi-select (tab to select)
fzf --height 40%                 # inline (not fullscreen)
```
