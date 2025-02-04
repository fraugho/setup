#!/bin/bash

rm packages.txt

dnf list | awk 'NR > 1 {sub(/\.x86_64$/,"", $1); sub(/\.i686$/, "", $1); print $1}' >packages.txt

git add .
git commit -m "$(date +"%d/%m/%Y %H:%M")"
git push
