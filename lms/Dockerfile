FROM nginx:alpine

LABEL maintainer="Ansha Montessori LMS <admin@anshashinekidsschool.com>"
LABEL description="Ansha Montessori Learning Management System"

# Clear default nginx html
RUN rm -rf /usr/share/nginx/html/*

# Copy all LMS static files
COPY . /usr/share/nginx/html/

# Override nginx default config with our custom config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Remove server-side scripts and build artifacts (not needed in container)
RUN rm -f /usr/share/nginx/html/server.pl \
          /usr/share/nginx/html/server.ps1 \
          /usr/share/nginx/html/serve_test.pl \
          /usr/share/nginx/html/Dockerfile \
          /usr/share/nginx/html/nginx.conf \
          /usr/share/nginx/html/.dockerignore && \
    find /usr/share/nginx/html -name "*.bat" -delete && \
    find /usr/share/nginx/html -name "START *.bat" -delete

EXPOSE 80

# Health check — verify the login page loads
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD wget -q --spider http://localhost/index.html || exit 1

CMD ["nginx", "-g", "daemon off;"]
