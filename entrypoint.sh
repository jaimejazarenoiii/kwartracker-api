#!/bin/bash
set -e
rm -f /kwartracker-api/tmp/pids/server.pid
bundle exec rake db:migrate:reset
exec "$@"

