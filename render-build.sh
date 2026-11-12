#!/usr/bin/env bash
set -e

echo "================================"
echo "JARVIS PRO - RENDER BUILD"
echo "================================"

echo "ZIP dosyalari kontrol ediliyor..."

for file in assets.zip docs.zip scripts.zip server.zip shared.zip; do
    if [ -f "$file" ]; then
        echo "Aciliyor: $file"
        unzip -o "$file" -d .
    else
        echo "UYARI: $file bulunamadi"
    fi
done

echo "Dosyalar acildi."

if [ ! -f "scripts/build.mjs" ]; then
    echo "HATA: scripts/build.mjs bulunamadi!"
    find . -maxdepth 4 -type f | head -200
    exit 1
fi

echo "Bagimliliklar yukleniyor..."
npm install --include=dev

echo "JARVIS derleniyor..."
npm run build

echo "BUILD BASARIYLA TAMAMLANDI."
