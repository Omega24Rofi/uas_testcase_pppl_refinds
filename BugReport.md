# Laporan Bug - Pengujian Aplikasi Refinds

## Bug #001: Halaman Login - Tidak Ada Validasi Format Email

**ID Bug:** BUG-001  
**Tanggal:** 15 Juni 2025  
**Pelapor:** Tim Pengujian  
**Tingkat Keparahan:** Sedang  
**Prioritas:** Tinggi  
**Status:** Terbuka

**Ringkasan:** Form login menerima format email yang tidak valid tanpa validasi

**Langkah untuk Mereproduksi:**

1. Navigasi ke halaman Login (http://localhost:3000/login)
2. Masukkan email tidak valid: "email-invalid" (tanpa simbol @)
3. Masukkan password valid: "rofifaja@gmail.com"
4. Klik tombol Login

**Hasil yang Diharapkan:**

- Pesan error harus ditampilkan: "Silakan masukkan format email yang valid"
- Login tidak boleh dilanjutkan

**Hasil Aktual:**

- Tidak ada pesan error validasi yang ditampilkan
- Proses login tetap dilanjutkan (dapat menyebabkan error server atau perilaku tidak terduga)

**Lingkungan Pengujian:**

- Browser: Chrome 91+
- OS: Windows
- URL Aplikasi: http://localhost:3000

**Referensi Kasus Uji:** TC02

---

## Bug #002: Halaman Login - Tidak Ada Validasi Field Wajib

**ID Bug:** BUG-002  
**Tanggal:** 15 Juni 2025  
**Pelapor:** Tim Pengujian  
**Tingkat Keparahan:** Sedang  
**Prioritas:** Tinggi  
**Status:** Terbuka

**Ringkasan:** Form login memungkinkan submit dengan field email kosong

**Langkah untuk Mereproduksi:**

1. Navigasi ke halaman Login
2. Biarkan field email kosong
3. Masukkan password: "passwordvalid"
4. Klik tombol Login

**Hasil yang Diharapkan:**

- Pesan error: "Email wajib diisi"
- Form tidak boleh disubmit

**Hasil Aktual:**

- Tidak ada error validasi
- Form tetap dicoba untuk disubmit

**Referensi Kasus Uji:** TC04

---

## Bug #003: Halaman Login - Tidak Ada Validasi Password

**ID Bug:** BUG-003  
**Tanggal:** 15 Juni 2025  
**Pelapor:** Tim Pengujian  
**Tingkat Keparahan:** Sedang  
**Prioritas:** Tinggi  
**Status:** Terbuka

**Ringkasan:** Form login memungkinkan submit dengan field password kosong

**Langkah untuk Mereproduksi:**

1. Navigasi ke halaman Login
2. Masukkan email valid: "rofifaja@gmail.com"
3. Biarkan field password kosong
4. Klik tombol Login

**Hasil yang Diharapkan:**

- Pesan error: "Password wajib diisi"
- Form tidak boleh disubmit

**Hasil Aktual:**

- Tidak ada error validasi
- Form tetap dicoba untuk disubmit

**Referensi Kasus Uji:** TC05

---

## Bug #004: Modal Ulasan - Tidak Ada Validasi Rating

**ID Bug:** BUG-004  
**Tanggal:** 15 Juni 2025  
**Pelapor:** Tim Pengujian  
**Tingkat Keparahan:** Rendah  
**Prioritas:** Sedang  
**Status:** Terbuka

**Ringkasan:** Form ulasan memungkinkan submit tanpa memilih rating

**Langkah untuk Mereproduksi:**

1. Selesaikan flow pemesanan hingga modal ulasan muncul
2. Masukkan teks ulasan: "Produk bagus"
3. Jangan pilih rating apapun (biarkan semua radio button tidak terpilih)
4. Klik tombol "Kirim"

**Hasil yang Diharapkan:**

- Pesan error: "Silakan pilih rating"
- Form tidak boleh disubmit

**Hasil Aktual:**

- Ulasan berhasil dikirim tanpa rating
- Tidak ada error validasi yang ditampilkan

**Referensi Kasus Uji:** TC14

---

## Bug #005: Modal Ulasan - Tidak Ada Validasi Teks Ulasan

**ID Bug:** BUG-005  
**Tanggal:** 15 Juni 2025  
**Pelapor:** Tim Pengujian  
**Tingkat Keparahan:** Rendah  
**Prioritas:** Sedang  
**Status:** Terbuka

**Ringkasan:** Form ulasan memungkinkan submit dengan teks ulasan kosong

**Langkah untuk Mereproduksi:**

1. Selesaikan flow pemesanan hingga modal ulasan muncul
2. Pilih rating: 5 bintang
3. Biarkan textarea ulasan kosong
4. Klik tombol "Kirim"

**Hasil yang Diharapkan:**

- Pesan error: "Silakan masukkan ulasan Anda"
- Form tidak boleh disubmit

**Hasil Aktual:**

- Ulasan berhasil dikirim dengan teks kosong
- Tidak ada error validasi yang ditampilkan

**Referensi Kasus Uji:** TC15

---

## Bug #006: Umum - Penanganan Error yang Tidak Konsisten

**ID Bug:** BUG-006  
**Tanggal:** 15 Juni 2025  
**Pelapor:** Tim Pengujian  
**Tingkat Keparahan:** Sedang  
**Prioritas:** Sedang  
**Status:** Terbuka

**Ringkasan:** Aplikasi tidak memiliki validasi client-side yang konsisten di seluruh form

**Deskripsi:**
Beberapa form di seluruh aplikasi (Login, Ulasan) tidak mengimplementasikan validasi client-side yang proper, yang menyebabkan pengalaman pengguna yang buruk dan kemungkinan error server-side.

**Dampak:**

- Pengalaman pengguna yang buruk
- Beban server meningkat karena request yang tidak valid
- Potensi kerentanan keamanan

**Rekomendasi:**
Kami merekomendasikan implementasi validasi client-side yang komprehensif untuk semua form termasuk:

- Validasi field wajib
- Validasi format (email, telepon, dll.)
- Validasi panjang karakter
- Pattern matching jika diperlukan

---

## Laporan Ringkasan Bug

| ID Bug  | Komponen | Tingkat Keparahan | Status  | Kasus Uji |
| ------- | -------- | ----------------- | ------- | --------- |
| BUG-001 | Login    | Sedang            | Terbuka | TC02      |
| BUG-002 | Login    | Sedang            | Terbuka | TC04      |
| BUG-003 | Login    | Sedang            | Terbuka | TC05      |
| BUG-004 | Ulasan   | Rendah            | Terbuka | TC14      |
| BUG-005 | Ulasan   | Rendah            | Terbuka | TC15      |
| BUG-006 | Umum     | Sedang            | Terbuka | Multiple  |

**Total Bug Ditemukan:** 6  
**Prioritas Tinggi:** 2  
**Prioritas Sedang:** 3  
**Prioritas Rendah:** 1

## Catatan Pengujian

- Semua bug ditemukan selama pengujian sistematis boundary value dan equivalence partitioning
- Pengujian otomatis fokus pada skenario positif; skenario negatif mengungkap masalah validasi ini
- Kami merekomendasikan pengujian manual untuk cakupan validasi yang komprehensif
- Tim kami siap memberikan bantuan teknis untuk perbaikan bug-bug yang ditemukan
