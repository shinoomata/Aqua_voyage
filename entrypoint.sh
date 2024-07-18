#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app_name/tmp/pids/server.pid

# プリコンパイルのステップを追加
if [ "$RAILS_ENV" == "production" ]; then
  echo "Running in production mode. Precompiling assets."
  bundle exec rake assets:precompile
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
