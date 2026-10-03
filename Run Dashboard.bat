@echo off
setlocal EnableDelayedExpansion
cd /d "%~dp0"
where py >nul 2>nul
if %errorlevel%==0 (
  start "Employee Skills Dashboard Server" py -m http.server 8000
  goto open_dashboard
)
where python >nul 2>nul
if %errorlevel%==0 (
  for /f "delims=" %%P in ('where python') do set "PYTHON_PATH=%%P"
  if /i "!PYTHON_PATH!"=="C:\Users\%USERNAME%\AppData\Local\Microsoft\WindowsApps\python.exe" goto powershell_server
  start "Employee Skills Dashboard Server" "!PYTHON_PATH!" -m http.server 8000
  goto open_dashboard
)
 :powershell_server
where powershell >nul 2>nul
if %errorlevel%==0 (
  start "Employee Skills Dashboard Server" powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0Run Dashboard Server.ps1"
  goto open_dashboard
)
echo Python or PowerShell is required for this launcher. Install Python or use VS Code Live Server.
pause
exit /b 1
:open_dashboard
timeout /t 2 /nobreak >nul
start "" "http://localhost:8000/index.html"
