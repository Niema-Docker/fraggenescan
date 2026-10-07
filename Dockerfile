# Minimal Docker image for FragGeneScan using Alpine base
FROM alpine:latest

# install FragGeneScan
RUN apk update && \
    apk add --no-cache bash gcc make musl-dev perl && \
    wget -qO- "https://github.com/gaberoo/FragGeneScan/archive/refs/tags/v1.3.0.tar.gz" | tar -zx && \
    cd FragGeneScan-* && \
    make clean && \
    make fgs && \
    mv FragGeneScan run_FragGeneScan.pl /usr/local/bin/ && \
    cd .. && \
    rm -rf FragGeneScan-*
