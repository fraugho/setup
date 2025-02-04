#!/bin/bash

# Add the Mullvad repository server to dnf
sudo dnf config-manager --add-repo https://repository.mullvad.net/rpm/stable/mullvad.repo

while read package; do
  sudo dnf install $package
done <packages.txt
