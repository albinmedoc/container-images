ARG BASE_IMAGE=n8nio/n8n:2.6.4
ARG FFMPEG_IMAGE=mwader/static-ffmpeg:7.1
ARG MEGAJS_VERSION=1.3.9

FROM ${FFMPEG_IMAGE} AS ffmpeg

FROM ${BASE_IMAGE}

COPY --from=ffmpeg /ffmpeg /usr/local/bin/ffmpeg
COPY --from=ffmpeg /ffprobe /usr/local/bin/ffprobe

USER root
RUN npm install -g megajs@${MEGAJS_VERSION}
USER node
