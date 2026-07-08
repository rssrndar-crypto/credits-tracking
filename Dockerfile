FROM python:3.12-alpine

WORKDIR /app
COPY . /app

# Default port and expose for Render (Render may set $PORT at runtime)
ENV PORT=10000
EXPOSE 10000

# Healthcheck: ensures the server responds on the configured port
HEALTHCHECK --interval=10s --timeout=5s --start-period=5s \
	CMD wget -qO- http://127.0.0.1:${PORT:-10000}/ || exit 1

# Bind to all interfaces and serve the app directory using the configured PORT
CMD ["sh", "-c", "python3 -m http.server \"${PORT:-10000}\" --bind 0.0.0.0 --directory /app"]
