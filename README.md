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

## OpenMAIC

OpenMAIC is built by a dedicated workflow from the upstream repository's own
Dockerfile. Run `Build and Push OpenMAIC` manually, or let its weekly schedule
check the pinned release. Configure provider credentials at runtime; do not put
API keys in Docker build arguments or the image.

```bash
docker run --rm -p 3000:3000 \
  -e OPENAI_API_KEY=your-key \
  ghcr.io/albinmedoc/openmaic:1.0.0
```

The default image provides the browser-backed deployment. PostgreSQL persistence
and MP4 rendering are optional OpenMAIC Compose services and are not bundled in
this image. Enable them by deploying the upstream `docker-compose.yml` profiles.
