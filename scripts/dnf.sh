#!/bin/bash

# Add the Mullvad repository server to dnf
sudo dnf config-manager --add-repo https://repository.mullvad.net/rpm/stable/mullvad.repo

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
sudo dnf install $(cat "$SCRIPT_DIR/../data/packages.txt")
