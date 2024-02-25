FROM rust:buster

WORKDIR /usr/src/app

COPY ./Cargo.toml ./Cargo.lock ./

# Create a dummy source file to allow `cargo build` to cache dependencies
RUN mkdir src \
    && echo "fn main() {}" > src/main.rs \
    && cargo build --release \
    && rm -rf src

RUN cargo install mdbook \
    && cargo install mdbook-toc \
    && cargo install mdbook-footnote \
    && cargo install mdbook-emojicodes \
    && cargo install mdbook-mermaid \
    && cargo install mdbook-catppuccin\
    && cargo install mdbook-plantuml

COPY . .

RUN cargo build --release

RUN mdbook build

CMD [ "mdbook", "serve", "--hostname", "0.0.0.0" ]