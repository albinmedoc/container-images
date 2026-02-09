# Container Images

Custom container images built and published to GHCR via GitHub Actions.

## Structure

```
images/
├── n8n/
│   └── Dockerfile
├── <future-image>/
│   └── Dockerfile
```

Each subdirectory under `images/` is a separate image. The workflow automatically detects which images changed and only builds those.

## Adding a new image

1. Create `images/<name>/Dockerfile`
2. Use `ARG BASE_IMAGE=<image>:<tag>` as the first line — Renovate will track the base image version
3. Push to master — GitHub Actions builds and pushes to `ghcr.io/albinmedoc/<name>:<tag>`

## Versioning

Image tags are derived from the base image version in the Dockerfile. For example:

```dockerfile
ARG BASE_IMAGE=n8nio/n8n:2.5.2
```

Produces: `ghcr.io/albinmedoc/n8n:2.5.2` and `ghcr.io/albinmedoc/n8n:latest`

## Automation

- **Renovate** monitors base image versions and creates PRs for updates
  - Patch updates: auto-merged
  - Minor/major updates: manual review
- **GitHub Actions** builds on push to master (only changed images)
