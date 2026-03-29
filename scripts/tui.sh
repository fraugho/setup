#!/bin/bash

# Install TUI tools not available via dnf
# Requires: cargo (via rustup), go, uv (all in packages.txt)

echo "Installing TUI tools from cargo/go/pip..."

# Ensure Rust toolchain is installed
if ! command -v cargo > /dev/null 2>&1; then
    echo "  Installing Rust stable toolchain..."
    rustup-init -y --no-modify-path
    source "$HOME/.cargo/env"
fi

# rainfrog - TUI database client for postgres
echo "  Installing rainfrog (cargo from git)..."
cargo install --locked --git https://github.com/achristmascarl/rainfrog.git

# lazydocker - TUI docker interface
echo "  Installing lazydocker (go)..."
go install github.com/jesseduffield/lazydocker@latest

# posting - TUI API client (like postman)
echo "  Installing posting (uv)..."
uv tool install posting

# cargo-flamegraph - one-command flamegraphs for Rust
echo "  Installing cargo-flamegraph (cargo)..."
cargo install flamegraph

# samply - sampling profiler, opens in Firefox profiler UI
echo "  Installing samply (cargo)..."
cargo install samply

