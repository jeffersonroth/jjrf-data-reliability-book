#!/usr/bin/env bash
# Builds the book
set -ex

export CARGO_PROFILE_RELEASE_LTO=true

echo "installing mdbook"
cargo install mdbook
# cargo install mdbook-linkcheck
cargo install mdbook-i18n
cargo install mdbook-toc
cargo install mdbook-footnote
cargo install mdbook-emojicodes
# cargo install mdbook-admonish
cargo install mdbook-mermaid
cargo install mdbook-plantuml
# cargo install mdbook-svgbob
# cargo install mdbook-man
# cargo install mdbook-pdf
# cargo install mdbook-katex
# cargo install mdbook-epub
cargo install mdbook-catppuccin
# cargo install mdbook-template
echo "init mdbook"
mdbook init --title="Data Reliability Engineering" --ignore=none
echo "recovering book.toml from backup"
cp ./book.backup.toml ./book.toml
echo "build mdbook"
mdbook build
echo "build done"
cd book