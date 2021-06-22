#!/bin/bash
set -e
rm -f /kwartracker-api/tmp/pids/server.pid
exec "$@"

