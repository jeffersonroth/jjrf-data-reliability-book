FROM yourusername/mdbook-environment

WORKDIR /usr/src/app

COPY . .

# Build the project. This step is optional if there's no additional Rust code to compile.
# RUN cargo build --release

# Build the mdBook project
RUN mdbook build

CMD ["mdbook", "serve", "--hostname", "0.0.0.0"]
