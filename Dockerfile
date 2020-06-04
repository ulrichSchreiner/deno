FROM debian:buster-slim

LABEL maintainer="ulrich.schreiner@gmail.com"

ARG DENO_VERSION=1.0.5

ENV DENO_URL=https://github.com/denoland/deno/releases/download/v${DENO_VERSION}/deno-x86_64-unknown-linux-gnu.zip

RUN apt update && \
    apt install -y --no-install-recommends \
        bsdtar \
        ca-certificates \
        curl        

RUN curl -sSL ${DENO_URL} | bsdtar -C /usr/bin -xf - && \
    chmod +x /usr/bin/deno

ENTRYPOINT ["/usr/bin/deno"]
