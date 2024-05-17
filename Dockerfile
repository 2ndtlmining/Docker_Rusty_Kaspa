# Use Ubuntu as base image
FROM ubuntu:latest

# Update package lists and install required packages
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    libssl-dev \
    pkg-config \
    protobuf-compiler \
    libprotobuf-dev \
    clang-format \
    clang-tidy \
    clang-tools \
    clang \
    clangd \
    libc++-dev \
    libc++1 \
    libc++abi-dev \
    libc++abi1 \
    libclang-dev \
    libclang1 \
    liblldb-dev \
    libllvm-ocaml-dev \
    libomp-dev \
    libomp5 \
    lld \
    lldb \
    llvm-dev \
    llvm-runtime \
    llvm \
    python3-clang

# Install curl
RUN apt-get install -y curl

# Install Rust toolchain with defaults
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add Cargo bin directory to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# Install wasm-pack
RUN cargo install wasm-pack

# Add wasm32-unknown-unknown target
RUN rustup target add wasm32-unknown-unknown

# Clone rusty-kaspa repository
RUN git clone https://github.com/kaspanet/rusty-kaspa
WORKDIR rusty-kaspa

# Set up and run the wallet
RUN cd wallet/wasm/web && cargo install basic-http-server


# Start the wallet
#CMD ["basic-http-server"]

# Expose ports for the node
EXPOSE 16111 16110 17110 18110 4000

# Run the node
WORKDIR rusty-kaspa
CMD ["cargo", "run", "--release", "--bin","kaspad"]