ARG BASE_IMAGE=n8nio/n8n:2.6.4

FROM alpine:3.21 AS ffmpeg
RUN apk add --no-cache ffmpeg

FROM ${BASE_IMAGE}

COPY --from=ffmpeg /usr/bin/ffmpeg /usr/bin/ffmpeg
COPY --from=ffmpeg /usr/bin/ffprobe /usr/bin/ffprobe
COPY --from=ffmpeg /usr/lib/lib*.so* /usr/lib/

USER node
