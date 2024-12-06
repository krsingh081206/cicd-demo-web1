# Start from the official Nginx image
FROM nginx:alpine
# Expose port 80 on container
EXPOSE 80
# Copy custom entrypoint script and template
COPY ./entrypoint.sh /docker-entrypoint.d/entrypoint.sh
COPY ./index.html.template /usr/share/nginx/html/index.html.template

# Ensure the entrypoint script is executable
RUN chmod +x /docker-entrypoint.d/entrypoint.sh

# Run the custom entrypoint script along with the default entrypoint
ENTRYPOINT ["/docker-entrypoint.d/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
