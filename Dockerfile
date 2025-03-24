FROM jeffroth/mdbook-environment:latest

WORKDIR /usr/src/app

COPY . /usr/src/app

# Build the mdBook project
RUN RUST_BACKTRACE=1 RUST_LOGS=info mdbook build

# Serve the book
CMD ["mdbook", "serve", "--hostname", "0.0.0.0"]
