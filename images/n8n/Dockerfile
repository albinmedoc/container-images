ARG BASE_IMAGE=n8nio/n8n:2.5.2
FROM ${BASE_IMAGE}

USER root

RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg && rm -rf /var/lib/apt/lists/*

USER node
