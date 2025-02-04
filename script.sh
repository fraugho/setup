#!/bin/bash

dnf list | awk '{sub(/\.x86_64$/,"", $1); sub(/\.i686$/, "", $1); print $1}' >packages.txt

chmod +x dnf.sh flatpak.sh git.sh

#run commands
parallel :: ./dnf.sh ./flatpak.sh ./bluetooth.sh ./git.sh

./bluetooth.sh

#cleanup
echo "Configuration complete!"
rm -rf ~/fedora-config
