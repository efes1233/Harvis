# Yayına alma: GitHub + Render

## 1) GitHub
```
cd Jarvis
git init && git add . && git commit -m "JARVIS"
git branch -M main
git remote add origin https://github.com/KULLANICI/jarvis.git
git push -u origin main
```
`.env` dosyası `.gitignore`'da; API anahtarların repoya **gitmez**. Anahtarı bir kez bile commit ettiysen hemen yenile.

## 2) Render (ücretsiz plan)
1. render.com → **New → Blueprint** → GitHub reposunu seç. `render.yaml` otomatik okunur.
2. Panelde **Environment** altına anahtarlarını gir: `GEMINI_API_KEY`, `GROQ_API_KEY`, `MISTRAL_API_KEY` (istersen `OPENROUTER_API_KEY`, `ELEVEN_API_KEY`).
3. `JARVIS_ERISIM_ANAHTARI` Render tarafından üretilir; Environment sayfasında görürsün. Siteyi ilk açtığında arayüz bunu sorar. (Herkese açık sitede kimse senin ücretsiz kotanı yakamasın diye.)
4. Deploy bitince `https://jarvis-xxxx.onrender.com` adresi hazır. HTTPS olduğu için mikrofon/kamera izni çalışır.

Notlar: Render ücretsiz planı boşta kalınca uyur; ilk istek ~30-60 sn sürebilir. Docker tercih edersen `Dockerfile` hazır (Render'da Runtime: Docker).

## 3) Beyinler (hepsi birlikte çalışır)
- Senaryo yazdırırken seçili tüm beyinler **paralel** çalışır, her birine rol verilir (YAZAR / YÖNETMEN / FİZİKÇİ), süre dolunca (30 sn veya 1 dk) hazır olanların işi tek filmde birleşir. Hiçbiri yanıt vermezse yerel yazar devreye girer.
- Bir beyin kota (429) hatası verirse 60 sn dinlendirilir, ücretsiz kotan boşa harcanmaz.
- Ücretsiz katman koşulları ve model adları değişir; `.env` içindeki `JARVIS_*_MODEL` ile model adını değiştirebilirsin.
