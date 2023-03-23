#!/bin/bash

set -e

# Ensure PID is reset. This can happen if docker isn't cleanly shut down.
rm -rf /app/tmp/pids

# Verify gems are up to date
if ! bundle check > /dev/null; then
  echo "Gems dependencies are out of date. Installing..."
  bundle install
fi

# The gem doesn't install proper ARM binaries so blow
# away its script and link to the binaries we installed
# in the Dockerfile
rm /usr/local/bundle/bin/wkhtmltoimage \
  && ln -s /usr/local/bin/wkhtmltoimage /usr/local/bundle/bin
rm /usr/local/bundle/bin/wkhtmltopdf \
  && ln -s /usr/local/bin/wkhtmltopdf /usr/local/bundle/bin

# yarn install

exec "$@"
