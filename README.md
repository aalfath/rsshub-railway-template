# RSSHub on Railway

A Railway template for [RSSHub](https://github.com/DIYgod/RSSHub), the open-source RSS feed generator for thousands of websites and social networks.

## What it deploys

| Service | Source | Notes |
|---|---|---|
| `RSSHub` | this repo (`Dockerfile`) | `diygod/rsshub:chromium-bundled-2026-11-15`, pinned by digest. Bundled Chromium, so routes that need a headless browser work out of the box. Public domain on port 1200, health check `/healthz` |
| `Redis` | Railway's Redis | Feed and content cache, stored on a volume so it survives redeploys |

## Variables

| Variable | Service | Default | Purpose |
|---|---|---|---|
| `PORT` | RSSHub | `1200` | Port RSSHub listens on (the domain points at it) |
| `REDIS_URL` | RSSHub | `${{Redis.REDIS_URL}}?family=0` | Private-network Redis URL (`family=0` lets the client resolve Railway's IPv6 private hosts) |

Everything else uses RSSHub's defaults. `start.sh` picks the Redis cache when `REDIS_URL` is set and the in-memory cache otherwise.

Optional settings you can add to the `RSSHub` service later (see the [RSSHub configuration docs](https://docs.rsshub.app/deploy/config)):

- `ACCESS_KEY`: restrict the instance. Feeds then need `?key=YOUR-KEY` (or a hashed `code`).
- `CACHE_EXPIRE` / `CACHE_CONTENT_EXPIRE`: route and content cache time in seconds (defaults 300 and 3600).
- Route credentials such as `TWITTER_AUTH_TOKEN`, `YOUTUBE_KEY` or `GITHUB_ACCESS_TOKEN` for routes that need them.

## Updates

The `Dockerfile` pins one upstream image by tag and digest. When the pin is bumped, the change is merged to `main` with a `CHANGELOG.md` entry, and Railway shows deployers of this template an "update available" notice. Read `CHANGELOG.md` before applying it.

Upstream publishes new date tags several times a day and RSSHub has no numbered releases, so this template moves to a newer date tag from time to time rather than on every upstream build.

## Local test

```sh
docker compose up --build
curl http://localhost:<published port>/healthz
```
