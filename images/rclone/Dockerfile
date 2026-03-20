# renovate: datasource=docker depName=rclone/rclone versioning=docker
ARG IMAGE_VERSION=1.73.2
ARG BASE_IMAGE=rclone/rclone:${IMAGE_VERSION}

FROM ${BASE_IMAGE}
RUN apk add --no-cache fuse3

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]