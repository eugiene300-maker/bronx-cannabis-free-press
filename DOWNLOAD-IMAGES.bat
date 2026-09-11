@echo off
echo Downloading site photos into assets\img ...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0download-images.ps1"
pause
