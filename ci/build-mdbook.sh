#!/usr/bin/env bash
# Builds the book
set -ex

export CARGO_PROFILE_RELEASE_LTO=true

echo "installing mdbook"
cargo install mdbook
echo "installing mdbook mermaid"
cargo install mdbook-mermaid
echo "init mdbook"
mdbook init --title="Data Reliability Engineering"
echo "recovering book.toml from backup"
cp ./book.backup.toml ./book.toml
echo "build mdbook"
mdbook build
echo "build done"
cd book