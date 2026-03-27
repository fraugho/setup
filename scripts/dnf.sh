#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Add third-party repos
sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo
sudo dnf config-manager addrepo --from-repofile=https://repo.librewolf.net/librewolf.repo
# Install all packages from the curated list
sudo dnf install -y $(cat "$SCRIPT_DIR/../data/packages.txt")
