#!/bin/bash

# Bluetooth
echo "Enabling bluetooth..."
sudo systemctl start bluetooth
sudo systemctl enable bluetooth
