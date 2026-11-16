# RSSHub for Railway: the official image, pinned by tag and digest.
# Upstream publishes date tags (chromium-bundled-YYYY-MM-DD) several times a day;
# this repo bumps the pin through a PR and a CHANGELOG entry.
FROM diygod/rsshub:chromium-bundled-2026-11-15@sha256:eb9dfe8f3ec793b72bbac666a83a4c17b08d642fe71ac978b106be37d20c7d05

COPY --chmod=755 start.sh /usr/local/bin/railway-start.sh

ENV NODE_ENV=production \
    PORT=1200

EXPOSE 1200

ENTRYPOINT ["dumb-init", "--"]
CMD ["/usr/local/bin/railway-start.sh"]
