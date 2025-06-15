# Test Suite: Pengujian E2E User Flow - Aplikasi RefindsppPL

## Cakupan Pengujian

**Aplikasi:** Aplikasi Web E-commerce Refinds
**Jenis Pengujian:** End-to-End User Flow Testing  
**Halaman yang Diuji:** Home → Login → Produk → Detail Produk → Checkout → Profil → Ulasan (7+ halaman)

## Framework Pengujian yang Kami Terapkan

### 1. Equivalence Partitioning (EP)

- **Kelas Data Valid:** Format email benar, password valid, produk yang tersedia
- **Kelas Data Invalid:** Format email salah, password salah, data yang tidak ada

### 2. Boundary Value Analysis (BVA)

- **Email:** Batas format valid vs invalid
- **Password:** Persyaratan panjang minimum
- **Pemilihan Produk:** Produk tersedia vs tidak tersedia

## Kasus Uji

| ID Kasus Uji | Halaman/Fitur | Skenario Pengujian                                  | Jenis Uji | Data Input                                                  | Hasil yang Diharapkan                   | Status     |
| ------------ | ------------- | --------------------------------------------------- | --------- | ----------------------------------------------------------- | --------------------------------------- | ---------- |
| **TC01**     | Login         | Login dengan kredensial valid (EP - Valid)          | Positif   | Email: "rofifaja@gmail.com", Password: "rofifaja@gmail.com" | Login berhasil, redirect ke dashboard   | ✅ Lulus   |
| **TC02**     | Login         | Login dengan format email invalid (EP - Invalid)    | Negatif   | Email: "email-invalid", Password: "passwordvalid"           | Pesan error: "Format email tidak valid" | ❌ Gagal\* |
| **TC03**     | Login         | Login dengan password salah (EP - Invalid)          | Negatif   | Email: "rofifaja@gmail.com", Password: "passwordsalah"      | Pesan error: "Kredensial tidak valid"   | ❌ Gagal\* |
| **TC04**     | Login         | Login dengan email kosong (BVA - Boundary)          | Negatif   | Email: "", Password: "passwordvalid"                        | Pesan error: "Email wajib diisi"        | ❌ Gagal\* |
| **TC05**     | Login         | Login dengan password kosong (BVA - Boundary)       | Negatif   | Email: "rofifaja@gmail.com", Password: ""                   | Pesan error: "Password wajib diisi"     | ❌ Gagal\* |
| **TC06**     | Produk        | Melihat daftar produk                               | Positif   | Navigasi ke halaman produk                                  | Daftar produk ditampilkan               | ✅ Lulus   |
| **TC07**     | Produk        | Memilih produk yang tersedia (EP - Valid)           | Positif   | Klik produk "debitis"                                       | Navigasi ke halaman detail              | ✅ Lulus   |
| **TC08**     | Detail Produk | Memesan produk yang tersedia                        | Positif   | Klik tombol "Pesan"                                         | Redirect ke WhatsApp                    | ✅ Lulus   |
| **TC09**     | Checkout      | Validasi redirect WhatsApp                          | Positif   | Setelah klik Pesan                                          | URL mengandung "wa.me" atau "whatsapp"  | ✅ Lulus   |
| **TC10**     | Profil        | Navigasi ke halaman profil                          | Positif   | Tombol Profil → Menu Profil                                 | Navigasi ke halaman profil              | ✅ Lulus   |
| **TC11**     | Profil        | Mengakses riwayat pembelian                         | Positif   | Klik tab "Pembelian"                                        | Tab pembelian teraktivasi               | ✅ Lulus   |
| **TC12**     | Profil        | Menyelesaikan proses pesanan                        | Positif   | Klik "Pesanan Selesai"                                      | Alert muncul                            | ✅ Lulus   |
| **TC13**     | Ulasan        | Mengirim ulasan dengan rating valid (EP - Valid)    | Positif   | Rating: 5, Ulasan: "lorem ipsum"                            | Ulasan berhasil dikirim                 | ✅ Lulus   |
| **TC14**     | Ulasan        | Mengirim ulasan tanpa rating (BVA - Boundary)       | Negatif   | Rating: tidak dipilih, Ulasan: "test"                       | Error: "Rating wajib dipilih"           | ❌ Gagal\* |
| **TC15**     | Ulasan        | Mengirim ulasan dengan teks kosong (BVA - Boundary) | Negatif   | Rating: 5, Ulasan: ""                                       | Error: "Teks ulasan wajib diisi"        | ❌ Gagal\* |

**Keterangan:**  
✅ Lulus - Kasus uji berhasil kami eksekusi  
❌ Gagal\* - Kasus uji gagal karena bug aplikasi (kami dokumentasikan dalam Laporan Bug)

## Ringkasan Eksekusi Pengujian

- **Total Kasus Uji:** 15
- **Lulus:** 9
- **Gagal:** 6 (karena bug aplikasi)
- **Cakupan Uji:** 7+ halaman (Home, Login, Produk, Detail, Checkout, Profil, Ulasan)

## Boundary Value & Equivalence Classes

### Halaman Login

- **Kelas Email Valid:** Mengandung "@" dan "." dengan format yang benar
- **Kelas Email Invalid:** Tidak ada "@", tidak ada ".", format salah
- **Kelas Password Valid:** String tidak kosong
- **Kelas Password Invalid:** String kosong, nilai null

### Sistem Ulasan

- **Kelas Rating Valid:** Nilai 1-5
- **Kelas Rating Invalid:** Tidak ada pilihan, nilai di luar 1-5
- **Kelas Teks Ulasan Valid:** String tidak kosong (1-500 karakter)
- **Kelas Teks Ulasan Invalid:** String kosong, panjang berlebihan

## Manajemen Kasus Uji

_Catatan: Kasus uji ini dapat kami impor ke dalam tools manajemen kasus uji seperti:_

- TestRail
- Zephyr
- qTest
- Azure DevOps Test Plans

## Cakupan Otomatisasi

Semua kasus uji positif (TC01, TC06-TC13) kami otomatisasi menggunakan:

- **Framework:** Cucumber + Selenium WebDriver
- **Pattern:** Page Object Model (POM)
- **Bahasa:** Java
- **Test Runner:** JUnit

## Kesimpulan

Pengujian yang kami lakukan telah mengcover flow lengkap dari login hingga pengiriman ulasan. Kami menemukan 6 bug terkait validasi input yang perlu diperbaiki untuk meningkatkan user experience dan keamanan aplikasi. Tim kami merekomendasikan perbaikan validasi client-side untuk semua form input guna memberikan feedback yang lebih baik kepada pengguna.
