FROM rust:buster

WORKDIR /

COPY ./Cargo.toml ./Cargo.toml
COPY ./Cargo.lock ./Cargo.lock
COPY ./assets .
COPY ./src ./src

RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf -y | sh &&\
    rustup update &&\
    cargo build --release &&\
    cargo install --path .

RUN mdbook-catppuccin install &&\
    mdbook build

CMD [ "/bin/sh", "-c", "mdbook serve --hostname '0.0.0.0'" ]
