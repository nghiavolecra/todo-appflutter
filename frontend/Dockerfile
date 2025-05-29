# frontend/Dockerfile

# Stage 1: build Flutter Web với Flutter 3.22 (Dart 3.8+)
FROM subosito/flutter:3.22.0 AS builder

ENV FLUTTER_SUPPRESS_ROOT_WARNING=true
WORKDIR /app
COPY . .

RUN flutter config --enable-web \
    && flutter pub get \
    && flutter build web --release

# Stage 2: serve bằng nginx
FROM nginx:alpine
COPY --from=builder /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
