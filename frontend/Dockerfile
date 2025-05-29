# frontend/Dockerfile

# Stage 1: build Flutter web
FROM cirrusci/flutter:stable AS builder

WORKDIR /app
COPY . .

# Bật web và build release ngay
RUN flutter config --enable-web && \
    flutter pub get && \
    flutter build web --release

# Stage 2: serve bằng nginx
FROM nginx:alpine

# (Tuỳ chọn) Xoá config default nếu bạn có nginx.conf riêng
# RUN rm /etc/nginx/conf.d/default.conf
# COPY nginx.conf /etc/nginx/conf.d

COPY --from=builder /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
