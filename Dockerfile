FROM python:3.12-alpine

WORKDIR /app
COPY . /app

EXPOSE 80

CMD ["sh", "-c", "python3 -m http.server \"${PORT:-80}\" --directory /app"]
