export PATH="/home/dophin2009/.local/share/cargo/bin:$PATH"

STABLE="/home/dophin2009/.local/share/rustup/toolchains/stable-x86_64-unknown-linux-gnu"
rustup toolchain link build-stable $STABLE &> /dev/null
rustup default build-stable &> /dev/null
