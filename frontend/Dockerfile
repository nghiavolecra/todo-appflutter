# Stage 1: build Flutter Web
FROM cirrusci/flutter:stable AS builder
WORKDIR /app
COPY . .
RUN flutter channel stable && flutter upgrade
RUN flutter config --enable-web
RUN flutter pub get
RUN flutter build web --release

# Stage 2: serve bằng nginx
FROM nginx:alpine
COPY --from=builder /app/build/web /usr/share/nginx/html
