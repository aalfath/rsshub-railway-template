#!/bin/sh
# Use Redis as the cache when REDIS_URL is set (the Railway template wires it
# to the Redis service), otherwise fall back to RSSHub's in-memory cache.
if [ -z "${CACHE_TYPE+x}" ]; then
  if [ -n "$REDIS_URL" ]; then
    export CACHE_TYPE=redis
  else
    export CACHE_TYPE=memory
  fi
fi
cd /app
exec npm run start
