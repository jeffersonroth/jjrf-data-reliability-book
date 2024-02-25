FROM rust:latest

RUN cargo install mdbook \
    && cargo install mdbook-toc \
    && cargo install mdbook-catppuccin \
    && cargo install mdbook-mermaid \
    && cargo install mdbook-plantuml \
    && cargo install mdbook-footnote \
    && cargo install mdbook-emojicodes

WORKDIR /usr/src/book

# By default, just keep the container running
CMD ["sleep", "infinity"]
