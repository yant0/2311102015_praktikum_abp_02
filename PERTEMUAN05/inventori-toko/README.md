# Inventori Toko CokWo

Sistem web inventari sederhana untuk mengelola produk pada "Toko CokWo" milih Pak Cokomi dan Mas Wowo. Aplikasi ini dibangun dengan framework Laravel, minimalis dan fokus pada fungsionalitas CRUD produk.

## Fitur Utama

- **Autentikasi (Login/Register)**: Menggunakan Laravel Breeze.
- **CRUD Produk**: Halaman untuk melihat daftar produk, menambah, mengedit, dan menghapus. Menampilkan data table dengan form create & edit, serta konfirmasi modal sebelum menghapus data.
- **Dashboard Statistik**: Melihat insight singkat mengenai total produk, total stok, dan nilai estimasi inventori.
- **No NPM/Build required**: Menggunakan Tailwind CSS dan Alpine.js secara langsung via CDN sehingga tidak memerlukan tahap `NPM RUN BUILD`. Mudah dijalankan hanya dengan environment PHP biasa!

## Persyaratan (Requirements)

- PHP >= 8.2 (Pastikan ekstensi pdo_mysql diaktifkan)
- MySQL/MariaDB
- Composer

## Instalasi & Cara Menjalankan

Ikuti langkah-langkah di bawah ini untuk menjalankan aplikasi di komputer lokal:

### 1. Kloning atau Buka Folder Project
Pastikan Anda berada di direktori project `inventori-toko`.

### 2. Konfigurasi Database `.env`
Buka file `.env`, lalu pastikan konfigurasi database sudah menggunakan mysql dan mengarah pada database `inventori_toko` Anda. Contoh:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=inventori_toko
DB_USERNAME=root
DB_PASSWORD=
```
*(Buat database lokal bernama `inventori_toko` melalui phpMyAdmin, TablePlus, atau CLI MySQL.)*

### 3. Install Dependensi PHP
Jalankan composer untuk menginstall package PHP (jika belum di-install):
```bash
composer install
```

### 4. Eksekusi Migrasi & Seeder Database
Aplikasi dilengkapi dengan struktur tabel otomatis dan data dummy produk serta user untuk memudahkan pengujian (Factory & Seeder).
Jalankan perintah ini untuk membangun tabel dan mengisi data ke database:
```bash
php artisan migrate:fresh --seed
```

### 5. Jalankan Server Development Laravel
Terakhir, start server lokal Laravel dengan baris ini:
```bash
php artisan serve
```

Aplikasi dapat diakses melalui browser pada `http://127.0.0.1:8000` atau `http://localhost:8000`.

## Akses Akun Tester
Anda bisa login menggunakan akun dummy yang sudah dibuat otomatis via Seeder.

1. **Akun Pertama**
   - **Email:** `cokomi@tokocokwo.com`
   - **Password:** `password`

2. **Akun Kedua**
   - **Email:** `wowo@tokocokwo.com`
   - **Password:** `password`

## Struktur Kode Inti
- `app/Models/Product.php` - Model database produk.
- `app/Http/Controllers/ProductController.php` - Logika kontroler CRUD produk.
- `database/migrations/*_create_products_table.php` - Skema tabel produk.
- `database/factories/ProductFactory.php` - Data dummy (Sembako/Barang Toko).
- `database/seeders/DatabaseSeeder.php` - Eksekutor Injeksi user dan produk.
- `resources/views/products/` - File Blade untuk halaman form, data table (index), update dan modal konfirmasi.
- `routes/web.php` - Definisi routing utama.

----

Dibuat untuk memudahkan operasional Pak Cokomi dan Mas Wowo. Selamat bekerja!
