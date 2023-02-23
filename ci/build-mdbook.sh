#!/usr/bin/env bash
# Builds the book
set -ex

export CARGO_PROFILE_RELEASE_LTO=true

echo "installing mdbook"
cargo install mdbook mdbook-linkcheck mdbook-man mdbook-mermaid mdbook-plantuml mdbook-admonish mdbook-catppuccin mdbook-pdf mdbook-template mdbook-toc mdbook-svgbob
echo "init mdbook"
mdbook init --title="Data Reliability Engineering"
echo "recovering book.toml from backup"
cp ./book.backup.toml ./book.toml
echo "build mdbook"
mdbook build
echo "build done"
cd book