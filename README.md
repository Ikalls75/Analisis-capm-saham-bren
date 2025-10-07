# Analisis CAPM Saham BREN (PT Barito Renewables Energy Tbk)
## 🚀 Ringkasan Proyek
Selamat datang di repositori analisis **Capital Asset Pricing Model (CAPM)** untuk saham BREN!  
Proyek ini bertujuan untuk mengestimasi ekspektasi imbal hasil ***(expected return)*** dari saham **PT Barito Renewables Energy Tbk** dengan membandingkan risikonya terhadap pasar (IHSG).

Seluruh proses, mulai dari pengumpulan data menggunakan **Python**, perhitungan statistik dengan **R**, hingga visualisasi interaktif menggunakan **Power BI**, didokumentasikan dalam repositori ini.

## 🗺️ Alur Kerja (Roadmap)
Proyek ini dibangun dengan alur yang jelas dan terstruktur. Berikut adalah "peta" pengerjaannya dari data mentah hingga menjadi sebuah ***insight***:

```data_collection.ipynb → Historical_Data.xlsx → Analisis-capm.R → Hasil_capm_bren.csv → BREN_dashboard.pbix```
Secara sederhana, prosesnya adalah:

- **Pengumpulan Data**: Script Python di `data_collection.ipynb` dijalankan untuk mengambil data harga saham historis.

- **Pengolahan & Analisis Awal**: Data mentah disimpan dan diolah lebih lanjut dalam `Historical_Data.xlsx` untuk menghitung return harian dan regresi.

- **Perhitungan Inti CAPM**: Script R pada `Analisis-capm.R` mengeksekusi formula CAPM menggunakan data yang sudah bersih.

- **Penyimpanan Hasil**: Output perhitungan dari R disimpan dalam `Hasil_capm_bren.csv`.

- **Visualisasi**: Seluruh data dan hasil diimpor ke `BREN_dashboard.pbix` untuk dibuat menjadi visualisasi yang mudah dipahami.

## 📁 Struktur Repositori
Semua file diatur dalam tiga folder utama agar mudah dinavigasi.
```
.
├──  Dashboard/
│   ├── BREN_dashboard.pbix         # File kerja Power BI berisi visualisasi interaktif
│   └── Screenshot_dashboard.png    # Gambar pratinjau dashboard
│
├── Data/
│   ├── Historical_Data.xlsx        # Berisi harga penutupan BREN & IHSG (9 Okt 2023 - 3 Okt 2025), perhitungan return, dan analisis regresi
│   └── Hasil_capm_bren.csv         # Output final perhitungan CAPM dari script R
│
└── Scripts/
    ├── Analisis-capm.R             # Script R untuk menghitung Beta, Expected Return, dll.
    └── data_collection.ipynb       # Jupyter Notebook (Python) untuk menarik data historis saham

```
## ⚙️ Asumsi & Parameter Teknis
Analisis ini didasarkan pada beberapa parameter kunci:

- **Risk-Free Rate** ***(Rf)***: Menggunakan nilai **6,33%**, yang diambil dari yield **Surat Utang Negara (SUN)** Indonesia tenor 10 tahun ***(sumber: Trading Economics).***

- **Market Return** ***(Rm)***: Diwakili oleh return dari Indeks **Harga Saham Gabungan (IHSG)** sebagai proksi pasar.

- **Periode Data**: Data harga penutupan harian yang digunakan adalah dari **9 Oktober 2023 hingga 3 Oktober 2025**.

## 📊 Pratinjau Dashboard
Berikut adalah cuplikan dari hasil akhir visualisasi di Power BI. Untuk versi interaktif, silakan buka file `.pbix` di dalam folder `Dashboard`.

<img width="958" height="523" alt="Screenshot 2025-10-07 120027" src="https://github.com/user-attachments/assets/bafa5980-794f-4d0f-95b1-a24d66281686" />
