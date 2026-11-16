# Changelog

Each entry is one update of this Railway template. Breaking changes come first.
Deployers see an "update available" notice in Railway when a change lands on `main`.

## 2026-11-16: Deploy on Railway button

- README: added the Deploy on Railway button for the published template `rsshub-3`. No change to what gets deployed.

## 2026-11-16: RSSHub chromium-bundled-2026-11-15

- First release of the template.
- RSSHub image `diygod/rsshub:chromium-bundled-2026-11-15@sha256:eb9dfe8f3ec793b72bbac666a83a4c17b08d642fe71ac978b106be37d20c7d05` (bundled Chromium, so routes that need a browser work without a separate browser service).
- Railway Redis with a volume as the cache.
