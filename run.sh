#!/bin/bash
# StockDSS v3.0 — Run Script (Linux/Mac)

echo ""
echo "  ╔══════════════════════════════════════════╗"
echo "  ║   🚀  StockDSS v3.0  —  IDX Analyzer    ║"
echo "  ╚══════════════════════════════════════════╝"
echo ""

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "  ❌ Node.js tidak ditemukan. Install dari https://nodejs.org"
    exit 1
fi

NODE_VER=$(node -v | sed 's/v//' | cut -d. -f1)
if [ "$NODE_VER" -lt 18 ]; then
    echo "  ❌ Node.js versi 18+ dibutuhkan. Versi saat ini: $(node -v)"
    exit 1
fi

echo "  ✅ Node.js $(node -v) terdeteksi"
echo ""

# Install dependencies
cd backend
if [ ! -d "node_modules" ]; then
    echo "  📦 Menginstall dependencies..."
    npm install
    echo ""
fi

# Run
echo "  🌐 Membuka http://localhost:3000 ..."
echo "  💡 Tekan Ctrl+C untuk menghentikan server"
echo ""
node server.js &
SERVER_PID=$!
sleep 2

# Open browser
if command -v xdg-open &> /dev/null; then
    xdg-open http://localhost:3000
elif command -v open &> /dev/null; then
    open http://localhost:3000
fi

wait $SERVER_PID
