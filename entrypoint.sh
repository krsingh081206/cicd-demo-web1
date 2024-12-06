#!/bin/sh
# entrypoint.sh

# Export the container hostname as an environment variable
export HOSTNAME=$(hostname)

# Replace placeholders with environment variables
envsubst '${MY_ENV_VAR} ${HOSTNAME}' < /usr/share/nginx/html/index.html.template > /usr/share/nginx/html/index.html

# Start Nginx
exec "$@"
