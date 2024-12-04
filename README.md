# **DOAKU - Aplikasi Doa Harian**

**DOAKU** adalah aplikasi berbasis Flutter yang menyediakan berbagai doa harian yang dapat diakses dengan mudah. Aplikasi ini memungkinkan pengguna untuk melihat daftar doa, mencari doa berdasarkan kategori, dan mempelajari detail doa dalam bahasa Arab, Latin, dan artinya. Aplikasi ini juga menyediakan jadwal sholat dan halaman profil untuk mengelola informasi pribadi pengguna.

## **Fitur Utama**
- **Halaman Utama**: Menampilkan sapaan pengguna, rekomendasi doa, dan jadwal sholat.
- **Pencarian Doa**: Pengguna dapat mencari doa berdasarkan kategori atau nama doa.
- **Detail Doa**: Menampilkan doa dalam bahasa Arab, Latin, dan artinya.
- **Profil Pengguna**: Pengguna dapat mengelola informasi akun, seperti nama, email, dan foto profil.
- **Integrasi API**: Mengambil data doa dari API untuk selalu menampilkan informasi terbaru.

## **Demo**

<img src="https://github.com/user-attachments/assets/54b20c02-48dc-47d5-bc9b-6c80fc6872c1?raw=true" width="150"/>
<img src="https://github.com/user-attachments/assets/e9b6fa81-ecde-43db-993f-b826c803e535?raw=true" width="150"/>


## **Prasyarat**

Sebelum menjalankan aplikasi **DOAKU**, pastikan kamu memiliki hal-hal berikut:
- **Flutter**: Aplikasi ini dibangun menggunakan Flutter. Pastikan kamu sudah menginstal Flutter SDK di perangkatmu.
- **Dart**: Aplikasi ini menggunakan bahasa pemrograman Dart.
- **API**: Aplikasi ini mengakses API untuk mendapatkan data doa. Pastikan perangkatmu terhubung ke internet agar data bisa diambil dengan benar.

## **Instalasi**

### 1. Kloning Repository
Untuk memulai, salin repositori ini ke perangkat lokal kamu. Cukup kunjungi halaman GitHub proyek ini, klik tombol "Clone or Download", dan salin URL repositori. Kemudian, buka terminal atau command prompt, dan jalankan perintah berikut:

- **Download proyek ke perangkat lokal**: Salin link repositori dan lakukan kloning repositori ke komputer lokal.

### 2. Instal Dependensi
Setelah berhasil mengkloning repositori, buka proyek di editor pilihanmu (seperti Visual Studio Code atau Android Studio). Kemudian, instal semua dependensi yang diperlukan dengan menjalankan perintah:

- **Instal dependensi**: Jalankan `flutter pub get` untuk mengunduh dan menginstal dependensi yang dibutuhkan oleh proyek.

### 3. Jalankan Aplikasi
Setelah semua dependensi terinstal, jalankan aplikasi di perangkat emulator atau perangkat fisik yang telah terhubung. Cukup pilih perangkat target dan jalankan aplikasi menggunakan IDE yang kamu pilih.

- **Jalankan aplikasi**: Pilih perangkat dan jalankan aplikasi di emulator atau perangkat fisik.

## **Struktur Proyek**

Berikut adalah struktur direktori utama dalam proyek **DOAKU**:

![image](https://github.com/user-attachments/assets/750d73ea-359b-4288-a6c8-241dd0a5093f)

### **Penjelasan Struktur**

1. **lib/**:
   - **main.dart**: Merupakan titik awal aplikasi yang memuat `MyApp()` dan mengonfigurasi routing dan tampilan awal.
   - **splash_screen.dart**: Menampilkan tampilan splash saat aplikasi pertama kali dijalankan.
   - **login_screen.dart**: Halaman login di mana pengguna dapat memasukkan informasi untuk mengakses aplikasi.
   - **home_screen.dart**: Halaman utama yang menampilkan menu aplikasi setelah pengguna berhasil login.
   - **doa_screen.dart**: Halaman yang menampilkan daftar doa yang dikelompokkan berdasarkan kategori.
   - **profile_screen.dart**: Halaman yang memungkinkan pengguna untuk melihat dan mengedit profil mereka.
   - **doa_model.dart**: Berisi model data untuk doa yang digunakan untuk menangani data yang diterima dari API.
   - **utils/**: Folder ini berisi file tambahan seperti `api_service.dart`, yang bertanggung jawab untuk mengelola request ke API dan memproses data yang diterima.

2. **assets/**:
   - **icons/**: Folder yang menyimpan file ikon dan gambar yang digunakan dalam aplikasi, seperti ikon gamepad untuk header.

3. **pubspec.yaml**:
   - File konfigurasi yang berisi daftar dependensi yang digunakan dalam proyek **DOAKU**, termasuk package Flutter dan package lainnya yang diperlukan.

4. **README.md**:
   - Dokumentasi proyek yang memberikan informasi kepada pengguna dan kontributor mengenai cara menjalankan aplikasi, struktur proyek, dan fitur utama dari aplikasi **DOAKU**.

---

## **Cara Kerja Aplikasi**

1. **Halaman Utama**: Pengguna akan disambut dengan **teks sapaan**, **avatar pengguna**, dan **pencarian doa**. Pengguna dapat melihat **rekomendasi doa** dan **jadwal sholat** pada halaman utama.
2. **Halaman Daftar Doa**: Pengguna dapat melihat daftar doa yang telah dikelompokkan dalam kategori tertentu, seperti **Doa Harian**, **Doa Kesehatan**, dll. Setiap doa dapat dipilih untuk melihat detailnya.
3. **Halaman Detail Doa**: Setelah memilih doa, pengguna akan melihat **teks doa** dalam bahasa Arab, **transliterasi Latin**, dan **arti doa**.
4. **Halaman Profil**: Pengguna dapat mengelola informasi pribadi, seperti **nama**, **email**, dan **foto profil**. Pengguna juga bisa melakukan **logout** untuk keluar dari aplikasi.

## **API yang Digunakan**

Aplikasi **DOAKU** mengakses data doa dari API berikut:

- **API Endpoint**: [https://doa-doa-api-ahmadramadhan.fly.dev/api](https://doa-doa-api-ahmadramadhan.fly.dev/api)
- **Data yang Diterima**: JSON berisi informasi tentang nama doa, teks doa dalam bahasa Arab, transliterasi Latin, dan arti doa.

## **Kontribusi**

Jika kamu ingin berkontribusi pada proyek ini, berikut adalah langkah-langkahnya:
1. Fork repositori ini.
2. Buat branch baru untuk fitur atau perbaikan yang akan kamu kerjakan.
3. Lakukan perubahan dan commit dengan pesan yang jelas.
4. Kirim pull request untuk perubahan yang telah kamu buat.

Kami sangat menghargai kontribusimu untuk meningkatkan aplikasi **DOAKU**!

## **Lisensi**

Proyek ini dilisensikan di bawah [MIT License](LICENSE).

---
