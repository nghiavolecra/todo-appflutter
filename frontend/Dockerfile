# frontend/Dockerfile

# Stage 1: build Flutter Web
FROM cirrusci/flutter:stable AS builder

# Tắt warning chạy dưới root
ENV FLUTTER_SUPPRESS_ROOT_WARNING=true

# Chuyển vào thư mục chứa pubspec.yaml
WORKDIR /app

# Chỉ copy code Flutter Web (folder frontend)
COPY . .

# Bật web support, cài package và build release
RUN flutter config --enable-web \
    && flutter pub get \
    && flutter build web --release

# Stage 2: serve bằng nginx
FROM nginx:alpine

# Xoá config default nếu bạn có config riêng
# RUN rm /etc/nginx/conf.d/default.conf
# COPY nginx.conf /etc/nginx/conf.d

# Copy kết quả build từ stage builder
COPY --from=builder /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
