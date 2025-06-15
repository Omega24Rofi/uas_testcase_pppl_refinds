Feature: User End-to-End Flow
  # Dokumentasi: Feature ini menguji alur utama aplikasi dari Home hingga Checkout
  
  Scenario: Login dengan data valid
    Given Pengguna berada di halaman Home
    When Pengguna klik tombol Login
    And Pengguna mengisi email "rofifaja@gmail.com" dan password "rofifaja@gmail.com"
    And Pengguna submit form login
    Then Pengguna berhasil login
    
  Scenario: Checkout dengan data valid
    Given Pengguna sudah login
    When Pengguna memilih produk dan menambah ke keranjang
    Then Pengguna berhasil checkout
    When Pengguna kembali dari WhatsApp ke halaman sebelumnya
    And Pengguna klik tombol profil
    And Pengguna klik menu Profile
    Then Pengguna diarahkan ke halaman profile
    When Pengguna klik tab Pembelian
    And Pengguna klik tombol Pesanan Selesai
    Then Alert muncul dan pengguna klik OK
    When Pop up penilaian muncul dan pengguna mengisi rating 5
    And Pengguna mengisi ulasan "lorem ipsum"
    And Pengguna klik tombol Kirim
    Then Alert konfirmasi muncul dan pengguna klik OK
    
  # Negative Test Cases - Boundary Value Analysis & Equivalence Partitioning
  
  Scenario: Login dengan email format tidak valid (Negative Case - EP)
    Given Pengguna berada di halaman Home
    When Pengguna klik tombol Login
    And Pengguna mengisi email "invalid-email" dan password "rofifaja@gmail.com"
    And Pengguna submit form login
    Then Pengguna melihat pesan error "Email format tidak valid"
    
  Scenario: Login dengan email kosong (Negative Case - BVA)
    Given Pengguna berada di halaman Home
    When Pengguna klik tombol Login
    And Pengguna mengisi email "" dan password "rofifaja@gmail.com"
    And Pengguna submit form login
    Then Pengguna melihat pesan error "Email wajib diisi"
    
  Scenario: Login dengan password kosong (Negative Case - BVA)
    Given Pengguna berada di halaman Home
    When Pengguna klik tombol Login
    And Pengguna mengisi email "rofifaja@gmail.com" dan password ""
    And Pengguna submit form login
    Then Pengguna melihat pesan error "Password wajib diisi"
    
  Scenario: Login dengan password salah (Negative Case - EP)
    Given Pengguna berada di halaman Home
    When Pengguna klik tombol Login
    And Pengguna mengisi email "rofifaja@gmail.com" dan password "wrongpassword"
    And Pengguna submit form login
    Then Pengguna melihat pesan error "Email atau password salah"
