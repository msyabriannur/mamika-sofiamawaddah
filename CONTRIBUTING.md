# Panduan Kontribusi — Mamika App

Terima kasih atas minat Anda untuk berkontribusi pada **Mamika**! Dokumen ini menjelaskan cara terlibat dalam pengembangan aplikasi ini.

---

## 📋 Prasyarat

Sebelum mulai, pastikan Anda memiliki:

- Flutter SDK 3.12.2+
- Android Studio, VS Code, atau IntelliJ IDEA dengan ekstensi Flutter/Dart
- Git
- Pemahaman dasar tentang Flutter & Dart

---

## 🚀 Setup Lingkungan Pengembangan

```bash
# 1. Fork repositori ini ke akun GitHub Anda

# 2. Clone fork Anda
git clone https://github.com/msyabriannur/mamika-sofiamawaddah.git
cd mamika

# 3. Tambahkan upstream remote
git remote add upstream https://github.com/msyabriannur/mamika-sofiamawaddah.git

# 4. Install dependencies
flutter pub get

# 5. Jalankan aplikasi untuk memastikan semuanya berjalan
flutter run
```

---

## 🌿 Alur Kerja Git

Kami menggunakan **Git Flow** sederhana:

| Branch | Tujuan |
|---|---|
| `main` | Kode produksi stabil |
| `develop` | Branch integrasi pengembangan |
| `feature/nama-fitur` | Fitur baru |
| `fix/nama-bug` | Perbaikan bug |
| `docs/nama-perubahan` | Perubahan dokumentasi |

### Langkah-langkah

```bash
# 1. Sinkronisasi dengan upstream
git fetch upstream
git checkout develop
git merge upstream/develop

# 2. Buat branch baru
git checkout -b feature/nama-fitur-anda

# 3. Kerjakan perubahan Anda

# 4. Commit dengan pesan yang jelas
git commit -m "feat: tambahkan fitur X untuk kebutuhan Y"

# 5. Push ke fork Anda
git push origin feature/nama-fitur-anda

# 6. Buat Pull Request ke branch develop
```

---

## 📝 Konvensi Commit

Gunakan format **Conventional Commits**:

```
<type>: <deskripsi singkat>

[body opsional]
```

| Type | Kapan Digunakan |
|---|---|
| `feat` | Menambahkan fitur baru |
| `fix` | Memperbaiki bug |
| `docs` | Perubahan dokumentasi |
| `style` | Perubahan formatting (bukan logika) |
| `refactor` | Refactoring kode |
| `test` | Menambah atau memperbaiki tes |
| `chore` | Pemeliharaan & konfigurasi |

**Contoh:**
```
feat: tambahkan timer untuk payudara kanan
fix: perbaiki tampilan grafik pada layar pertumbuhan bayi
docs: perbarui panduan instalasi di README
```

---

## 🎨 Standar Kode

### Dart / Flutter
- Ikuti [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style) resmi.
- Gunakan `flutter analyze` sebelum commit — pastikan tidak ada warning.
- Jaga kerapihan kode dan gunakan penamaan variabel yang deskriptif.

### Desain & UI
- Selaraskan desain dengan gaya warna utama (Primary Color: `#064673`).
- Pastikan komponen UI dipecah dengan baik ke dalam folder `lib/widgets/` untuk penggunaan ulang (reusable).
- Pastikan antarmuka (UI) tetap responsif dan konsisten untuk berbagai ukuran layar.

---

## 🧪 Testing

Sebelum membuat Pull Request:

```bash
# Analisis kode
flutter analyze

# Jalankan semua tes (jika ada)
flutter test

# Build debug untuk memastikan tidak ada error kompilasi
flutter build apk --debug
```

---

## 📥 Pull Request

### Checklist PR
Pastikan PR Anda memenuhi semua poin berikut:

- [ ] Kode sudah diuji di emulator/perangkat nyata
- [ ] `flutter analyze` tidak menampilkan error atau warning baru
- [ ] Dokumentasi diperbarui jika diperlukan
- [ ] Judul PR mengikuti konvensi commit

### Template Deskripsi PR

```markdown
## Ringkasan
[Deskripsi singkat perubahan yang dilakukan]

## Jenis Perubahan
- [ ] Bug fix
- [ ] Fitur baru
- [ ] Perubahan breaking (mempengaruhi fitur yang ada)
- [ ] Pembaruan dokumentasi

## Cara Menguji
[Langkah-langkah untuk menguji perubahan ini]

## Screenshot (jika ada perubahan UI)
```

---

## 🐛 Melaporkan Bug

Gunakan **GitHub Issues** dengan label `bug`. Sertakan informasi berikut:

- Versi aplikasi
- Versi OS & tipe perangkat
- Langkah-langkah untuk mereproduksi
- Perilaku yang diharapkan vs yang terjadi
- Screenshot atau log error (jika ada)

---

## 💡 Mengusulkan Fitur

Gunakan **GitHub Issues** dengan label `enhancement`. Jelaskan:

- Masalah yang ingin diselesaikan
- Solusi yang Anda usulkan
- Alternatif yang sudah dipertimbangkan

---

## 📬 Kontak

Jika Anda memiliki pertanyaan seputar kontribusi yang tidak cocok menjadi *Issue*, Anda dapat menghubungi tim pengembang melalui repositori ini atau melalui email kontak dari para kontributor proyek ini (msyabriannur & sofiamawaddah).

---

*Terima kasih telah membantu membuat Mamika menjadi aplikasi yang lebih baik bagi ibu dan si kecil! 🤱*
