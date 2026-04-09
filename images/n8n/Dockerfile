# renovate: datasource=docker depName=n8nio/n8n versioning=docker
ARG IMAGE_VERSION=2.16.0
ARG BASE_IMAGE=n8nio/n8n:${IMAGE_VERSION}
# renovate: datasource=docker depName=mwader/static-ffmpeg versioning=docker
ARG FFMPEG_VERSION=8.0
ARG FFMPEG_IMAGE=mwader/static-ffmpeg:${FFMPEG_VERSION}

FROM ${FFMPEG_IMAGE} AS ffmpeg

FROM ${BASE_IMAGE}

COPY --from=ffmpeg /ffmpeg /usr/local/bin/ffmpeg
COPY --from=ffmpeg /ffprobe /usr/local/bin/ffprobe

USER node
