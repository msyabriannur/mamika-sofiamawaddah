# 🤱 MAMIKA — Sahabat Setia Perjalanan Mengasihi Bunda

<p align="center">
  <img src="assets/images/app_icon.jpg" alt="Mamika Logo" width="120"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-1.0.0-teal?style=for-the-badge" alt="Version"/>
  <img src="https://img.shields.io/badge/platform-Android%20%7C%20iOS-green?style=for-the-badge" alt="Platform"/>
  <img src="https://img.shields.io/badge/Flutter-3.x-blue?style=for-the-badge&logo=flutter" alt="Flutter"/>
  <img src="https://img.shields.io/badge/mode-Offline-orange?style=for-the-badge" alt="Offline"/>
</p>

<p align="center">
  <strong>Aplikasi pendamping ibu untuk memantau aktivitas menyusui dan tumbuh kembang anak</strong><br/>
  Dilengkapi timer menyusui, panduan ASI, dan pemantauan gizi
</p>

---

## 📋 Daftar Isi

- [Tentang Aplikasi](#-tentang-aplikasi)
- [Fitur Utama](#-fitur-utama)
- [Screenshot](#-screenshot)
- [Tech Stack](#-tech-stack)
- [Persyaratan Sistem](#-persyaratan-sistem)
- [Instalasi & Setup Dev](#-instalasi--setup-dev)
- [Struktur Proyek](#-struktur-proyek)
- [Referensi Ilmiah](#-referensi-ilmiah)
- [Tim Pengembang](#-tim-pengembang)
- [Lisensi](#-lisensi)
- [Disclaimer](#-disclaimer)

---

## 🌟 Tentang Aplikasi

**Mamika** adalah aplikasi mobile cross-platform (Android & iOS) yang dirancang khusus untuk mempermudah para ibu dalam menjalani fase menyusui. Aplikasi ini membantu mencatat durasi menyusui, memantau asupan nutrisi ibu, serta melacak pertumbuhan si kecil dari hari ke hari.

Dengan antarmuka yang ramah pengguna, Mamika hadir sebagai sahabat yang siap membantu Bunda memastikan si kecil mendapatkan nutrisi terbaik sekaligus menjaga kesehatan Bunda sendiri.

---

## ✨ Fitur Utama

### ⏱️ Breastfeeding Tracker & Dashboard
- **Timer Menyusui** — Pencatatan durasi menyusui secara real-time untuk payudara kanan dan kiri.
- **Statistik Harian** — Pantau total durasi menyusui, frekuensi menyusui dalam sehari, dan asupan air minum Bunda.
- **Tips Hari Ini** — Notifikasi dan tips harian seputar kesehatan ibu dan bayi.

### 🍽️ Makan & Minum Ibu
Pencatatan asupan makanan dan minuman (hidrasi) Bunda untuk memastikan produksi ASI tetap lancar dan berkualitas.

### 🍼 Panduan Simpan ASI
Panduan komprehensif mengenai cara memompa, menyimpan, dan mencairkan ASI (Air Susu Ibu) perah dengan benar sesuai standar kesehatan.

### 📈 Pertumbuhan Bayi
Fitur pemantauan untuk melacak berat badan, panjang badan, dan perkembangan anak secara berkala menggunakan grafik pertumbuhan (didukung oleh `fl_chart`).

### 👩‍⚕️ Tanya Ahli & Catatan
- **Tanya Ahli** — Akses informasi dan panduan terpercaya dari para ahli seputar laktasi dan tumbuh kembang anak.
- **Catatan Bunda** — Buku harian digital untuk menyimpan momen berharga atau keluhan harian.

---

## 📱 Screenshot

> *(Tambahkan screenshot aplikasi di sini)*

| Dashboard | Timer Menyusui | Pertumbuhan Bayi | Panduan ASI |
|:---:|:---:|:---:|:---:|
| <img src="assets/images/screenshot_dashboard.png" width="150" alt="Dashboard"> | <img src="assets/images/screenshot_timer.png" width="150" alt="Timer"> | <img src="assets/images/screenshot_growth.png" width="150" alt="Growth"> | <img src="assets/images/screenshot_guide.png" width="150" alt="Guide"> |

---

## 🛠️ Tech Stack

Aplikasi ini dibangun menggunakan teknologi modern:
- **Framework:** [Flutter](https://flutter.dev/) (SDK ^3.12.2)
- **Language:** Dart
- **UI & Typography:** Google Fonts, Cupertino Icons
- **Charting:** `fl_chart`
- **Utilities:** `url_launcher`

---

## ⚙️ Persyaratan Sistem

Untuk menjalankan aplikasi atau melakukan pengembangan:
- **Flutter SDK:** Versi 3.12.2 atau lebih baru
- **Android:** Min. SDK 21 (Android 5.0 Lollipop)
- **iOS:** iOS 11.0 atau lebih baru
- **IDE:** Android Studio, VS Code, atau IntelliJ IDEA

---

## 🚀 Instalasi & Setup Dev

Ikuti langkah-langkah berikut untuk menjalankan Mamika di lingkungan lokal:

1. **Clone repositori:**
   ```bash
   git clone https://github.com/msyabriannur/mamika-sofiamawaddah.git
   cd mamika
   ```

2. **Unduh dependensi:**
   ```bash
   flutter pub get
   ```

3. **Jalankan aplikasi di emulator atau device fisik:**
   ```bash
   flutter run
   ```

---

## 📁 Struktur Proyek

```text
mamika/
├── assets/
│   └── images/              # Logo dan ilustrasi statis
├── lib/
│   ├── screens/             # Halaman antarmuka aplikasi (Dashboard, Timer, dll)
│   │   └── guides/          # Halaman khusus panduan
│   ├── widgets/             # Komponen UI yang dapat digunakan ulang (Reusable)
│   ├── globals.dart         # Variabel global & tema
│   └── main.dart            # Titik masuk utama (Entry point)
├── pubspec.yaml             # Konfigurasi dependensi proyek
└── README.md                # Dokumentasi proyek
```

---

## 📚 Referensi Ilmiah

Materi panduan ASI dan tumbuh kembang anak dalam aplikasi ini dirangkum dari berbagai sumber kesehatan masyarakat dan standar pedoman gizi yang berlaku.

---

## 👥 Tim Pengembang

- **msyabriannur** 
- **sofiamawaddah**

---

## 📄 Lisensi

Proyek ini bersifat tertutup (Proprietary). Tidak diperkenankan untuk menyalin, mendistribusikan, atau menggunakan kode sumber untuk tujuan komersial tanpa izin tertulis dari tim pengembang.

---

## ⚠️ Disclaimer

Aplikasi **Mamika** dirancang sebagai alat bantu pencatatan (tracker) dan penyedia informasi edukatif seputar menyusui serta tumbuh kembang bayi. Aplikasi ini **bukanlah alat medis** dan **tidak dapat menggantikan diagnosis, anjuran, atau perawatan dari tenaga medis profesional (dokter / konselor laktasi)**.

Jika Bunda menemukan masalah kesehatan pada diri sendiri maupun si kecil, segera konsultasikan ke dokter atau fasilitas layanan kesehatan terdekat.
