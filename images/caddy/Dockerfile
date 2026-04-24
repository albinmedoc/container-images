# renovate: datasource=docker depName=caddy versioning=docker
ARG IMAGE_VERSION=2.11.2
ARG BASE_IMAGE=caddy:${IMAGE_VERSION}-alpine
ARG BUILDER_IMAGE=caddy:${IMAGE_VERSION}-builder

FROM ${BUILDER_IMAGE} AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddyserver/replace-response

FROM ${BASE_IMAGE}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
