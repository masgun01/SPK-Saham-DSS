@echo off
echo.
echo  ==========================================
echo     StockDSS v3.1  --  IDX Analyzer
echo  ==========================================
echo.

where node >nul 2>nul
if %errorlevel% neq 0 (
    echo  [ERROR] Node.js tidak ditemukan.
    echo  Install dari: https://nodejs.org
    echo.
    pause
    exit /b 1
)

echo  [OK] Node.js terdeteksi:
node -v
echo.

cd backend

echo  [INFO] Membersihkan dependencies lama...
if exist node_modules rmdir /s /q node_modules

echo  [INFO] Menginstall dependencies...
call npm install
echo.

echo  [INFO] Server berjalan di http://localhost:3000
echo  [INFO] Tekan Ctrl+C untuk menghentikan
echo.

start "" http://localhost:3000

node server.js

pause
