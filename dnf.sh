#!/bin/bash

# Add the Mullvad repository server to dnf
sudo dnf config-manager --add-repo https://repository.mullvad.net/rpm/stable/mullvad.repo

sudo dnf isntall $(cat packages.txt)
