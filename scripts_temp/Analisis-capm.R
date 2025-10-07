# -------------------------------------------------------------------
# BAGIAN 1: MEMUAT DAN MEMBERSIHKAN DATA
# -------------------------------------------------------------------

# Memuat library yang dibutuhkan (cukup sekali di awal script)
library(readxl)

# Memuat data dari sheet spesifik dalam file Excel
# Pastikan path file sudah benar
file_path <- "D:/pycharm/capm Analysis/Data/Historical_Data.xlsx"
data_raw <- read_excel(file_path, sheet = "DataReturn")

# Membersihkan data dari baris yang mungkin kosong (NA) di seluruh tabel
data_clean <- na.omit(data_raw)

# Opsional: Menampilkan beberapa baris pertama data yang sudah bersih
# print(head(data_clean))

# -------------------------------------------------------------------
# BAGIAN 2: PERHITUNGAN KOMPONEN CAPM
# -------------------------------------------------------------------

# 2.1. Definisikan Risk-Free Rate (Rf) Tahunan
# Menggunakan yield SUN 10 tahun (misal: 6.33%)
risk_free_rate <- 0.0633 

# 2.2. Hitung Expected Market Return (E(Rm)) Tahunan
# Menghitung rata-rata return harian IHSG, lalu dianualisasi (dikali 252 hari perdagangan)
expected_market_return <- mean(data_clean$Return_IHSG) * 252

# 2.3. Hitung Beta (β) Saham
# Beta adalah koefisien slope dari regresi linear return saham (Y) terhadap return pasar (X)
model_capm <- lm(Return_BREN ~ Return_IHSG, data = data_clean)
beta_bren <- coef(model_capm)[2]

# -------------------------------------------------------------------
# BAGIAN 3: KALKULASI CAPM DAN MENAMPILKAN HASIL
# -------------------------------------------------------------------

# 3.1. Aplikasikan Formula CAPM: E(R) = Rf + β * (E(Rm) - Rf)
expected_return_bren <- risk_free_rate + beta_bren * (expected_market_return - risk_free_rate)

# 3.2. Tampilkan Hasil Perhitungan di Console dengan format yang jelas
cat("--- HASIL PERHITUNGAN CAPM UNTUK SAHAM BREN ---\n\n")
cat(paste0("1. Risk-Free Rate (Rf) Tahunan : ", sprintf("%.2f%%", risk_free_rate * 100), "\n"))
cat(paste0("2. Expected Market Return (E(Rm)): ", sprintf("%.2f%%", expected_market_return * 100), "\n"))
cat(paste0("3. Beta (β) Saham BREN         : ", round(beta_bren, 4), "\n\n"))
cat(paste0("-> Expected Return BREN (CAPM)  : ", sprintf("%.2f%%", expected_return_bren * 100), "\n"))
cat("------------------------------------------------\n")

# -------------------------------------------------------------------
# BAGIAN 4: MENYIMPAN HASIL AKHIR KE FILE CSV
# -------------------------------------------------------------------

# 4.1. Buat dataframe (tabel) dari hasil perhitungan
hasil_akhir_df <- data.frame(
  Metrik = c("Risk-Free Rate (Rf)",
             "Expected Market Return (E(Rm))",
             "Beta (β) Saham",
             "Expected Return BREN (CAPM)"),
  Nilai = c(risk_free_rate,
            expected_market_return,
            beta_bren,
            expected_return_bren)
)

write.csv(hasil_akhir_df, "hasil_capm_bren.csv", row.names = FALSE)