FROM rust:buster

WORKDIR /

COPY ./Cargo.toml ./Cargo.toml
COPY ./Cargo.lock ./Cargo.lock
COPY ./book.toml ./book.toml
COPY ./assets ./assets
COPY ./src ./src

RUN cargo install --path . &&\
    cargo install mdbook &&\
    cargo install mdbook-catppuccin &&\
    cargo install mdbook-toc &&\
    cargo install mdbook-mermaid &&\
    cargo install mdbook-plantuml &&\
    cargo install mdbook-footnote &&\
    cargo install mdbook-emojicodes

RUN mdbook-catppuccin install &&\
    mdbook build

CMD [ "/bin/sh", "-c", "mdbook serve --hostname '0.0.0.0'" ]
