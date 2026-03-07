ARG BASE_IMAGE=node:22-slim
# renovate: datasource=npm depName=@anthropic-ai/claude-code
ARG IMAGE_VERSION=2.1.71

FROM ${BASE_IMAGE}

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates git curl gpg && \
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
      | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
      > /etc/apt/sources.list.d/github-cli.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends gh && \
    apt-get purge -y curl gpg && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

ARG IMAGE_VERSION
RUN npm install -g @anthropic-ai/claude-code@${IMAGE_VERSION}

WORKDIR /workspace
