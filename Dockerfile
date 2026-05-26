FROM nginx:alpine

# Copy our static HTML to nginx default web root
COPY index.html /usr/share/nginx/html/index.html

# Health check endpoint for Coolify
RUN echo "ok" > /usr/share/nginx/html/health

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD wget --quiet --tries=1 --spider http://localhost/health || exit 1
