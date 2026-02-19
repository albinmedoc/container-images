ARG BASE_IMAGE=n8nio/n8n:2.8.3
ARG FFMPEG_IMAGE=mwader/static-ffmpeg:7.1
ARG MEGAJS_VERSION=1.3.9

FROM ${FFMPEG_IMAGE} AS ffmpeg

FROM ${BASE_IMAGE}

COPY --from=ffmpeg /ffmpeg /usr/local/bin/ffmpeg
COPY --from=ffmpeg /ffprobe /usr/local/bin/ffprobe

USER root
WORKDIR /tmp
RUN npm install megajs@${MEGAJS_VERSION} && \
    cp -rn /tmp/node_modules/* /usr/local/lib/node_modules/n8n/node_modules/ || true && \
    rm -rf /tmp/node_modules
USER node
