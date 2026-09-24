# DS5Dongle Config Web (Dockerized)

[![Publish Docker Image](https://github.com/johann-gillieron/ds5dongle-config-web-docker/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/johann-gillieron/ds5dongle-config-web-docker/actions/workflows/docker-publish.yml)

Dockerized version of https://github.com/awalol/ds5dongle-config-web by awalol.

This image packages the complete web interface into a standalone Docker container, allowing you to run the application locally without depending on a permanent internet connection.

## Features

- Ready-to-use Docker image
- Lightweight deployment
- No manual web server configuration required
- Local access through your browser
- Based on the original DS5Dongle-Config-Web project

## Docker Compose

Create a `docker-compose.yml` file:

```yaml
services:
  ds5dongle-config-web:
    image: ghcr.io/johann-gillieron/ds5dongle-config-web-docker:latest
    container_name: ds5dongle-config-web
    restart: unless-stopped
    ports:
      - "7000:80"
```

Start the container:

```bash
docker compose up -d
```

Open your browser and navigate to:

```text
http://YOUR_DOCKER_HOST_IP:7000
```

## Docker Run

Start the container directly:

```bash
docker run -d \
  --name ds5dongle-config-web \
  --restart unless-stopped \
  -p 7000:80 \
  ghcr.io/johann-gillieron/ds5dongle-config-web-docker:latest
```

Then open:

```text
http://YOUR_DOCKER_HOST_IP:7000
```

## Updating

Pull the latest image:

```bash
docker pull ghcr.io/johann-gillieron/ds5dongle-config-web-docker:latest
```

Recreate the container:

```bash
docker compose down
docker compose up -d
```

## Credits

- Original project: https://github.com/awalol/ds5dongle-config-web
- Docker packaging: Johann Gillieron

## Roadmap

- [ ] GitHub Actions automated image build
- [ ] Automatic rebuild on upstream changes
- [ ] Additional documentation and usage examples
- [ ] Validate Docker image configuration
