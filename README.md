# StockDSS v3.1 -- IDX Analyzer

Decision Support System untuk analisis saham Indonesia (IDX/BEI).

## Yang Baru di v3.1

- Tidak lagi menggunakan library yahoo-finance2 (penyebab error sebelumnya)
- Data diambil langsung via HTTPS ke Yahoo Finance API (query1 + query2 sebagai fallback)
- Fundamental real: ROE, ROA, PER, PBV, DER, Revenue, Net Income, dll
- Indikator teknikal: MA20/50/200, EMA, RSI, MACD, Bollinger Band, ATR, Stochastic
- Trading plan dinamis berbasis ATR
- Tidak perlu API key apapun

## Cara Menjalankan

### Windows
Klik 2x file run.bat

ATAU manual:
  cd backend
  npm install
  node server.js

Buka browser: http://localhost:3000

### Linux / Mac
  bash run.sh

## Dependencies

Hanya 3 package:
  - express
  - cors
  - technicalindicators

Tidak perlu yahoo-finance2, axios, atau library HTTP lainnya.
Data diambil menggunakan modul https bawaan Node.js.

## API Endpoints

POST /api/analyze
  Body: { "symbol": "BBCA" }

POST /api/compare
  Body: { "symbols": ["BBCA", "BBRI"] }

## DSS Scoring

Bobot:
  F - Fundamental  30%  (ROE, ROA, Margin, FCF, Dividen)
  V - Valuasi      20%  (PER, PBV, DER)
  G - Growth       20%  (Revenue growth, Net margin)
  T - Teknikal     20%  (MA, RSI, MACD, BB)
  S - Sentimen     10%  (Beta, Momentum)

Rekomendasi:
  > 80   STRONG BUY
  65-80  BUY
  50-64  HOLD
  < 50   SELL

## Disclaimer

Bukan saran investasi. Lakukan riset mandiri.
