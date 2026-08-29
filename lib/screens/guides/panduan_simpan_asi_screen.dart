import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PanduanSimpanAsiScreen extends StatelessWidget {
  const PanduanSimpanAsiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF064673);
    const secondaryColor = Color(0xFF30628A);
    const textOnSurfaceVariant = Color(0xFF5A7182);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Panduan',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Hero Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2EFFC).withValues(alpha: 0.55),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Manajemen ASIP',
                      style: GoogleFonts.manrope(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Panduan Menyimpan ASI Ibu Pekerja',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tips dan aturan menyimpan ASI perah (ASIP) agar nutrisi penting bagi si Kecil tetap terjaga selama Bunda bekerja.',
                    style: GoogleFonts.manrope(
                      fontSize: 13,
                      color: textOnSurfaceVariant,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Hero Image
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFE2EFFC), width: 1.5),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/images/storing_asi.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),

              // Section 1: Suhu Penyimpanan ASI
              Row(
                children: [
                  const Icon(Icons.thermostat, color: primaryColor, size: 22),
                  const SizedBox(width: 8),
                  Text(
                    'Aturan Suhu & Daya Tahan ASIP',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Suhu list cards
              _buildTempCard(
                icon: Icons.device_thermostat,
                iconColor: const Color(0xFFEA580C),
                bgColor: const Color(0xFFFFF7ED),
                borderColor: const Color(0xFFFFEDD5),
                title: 'Suhu Ruangan (25°C)',
                tag: 'Tahan 4 Jam',
                desc:
                    'Letakkan di wadah tertutup dan hindari sinar matahari langsung. Segera berikan atau simpan di kulkas.',
              ),
              const SizedBox(height: 12),
              _buildTempCard(
                icon: Icons.work_outline,
                iconColor: const Color(0xFFD97706),
                bgColor: const Color(0xFFFEF3C7),
                borderColor: const Color(0xFFFDE68A),
                title: 'Tas Pendingin (Cooler Bag)',
                tag: 'Tahan 24 Jam',
                desc:
                    'Sangat membantu bagi Bunda yang memerah ASI di kantor. Pastikan dilengkapi dengan ice pack yang cukup beku.',
              ),
              const SizedBox(height: 12),
              _buildTempCard(
                icon: Icons.kitchen,
                iconColor: const Color(0xFF2563EB),
                bgColor: const Color(0xFFEFF6FF),
                borderColor: const Color(0xFFDBEAFE),
                title: 'Kulkas Bawah (4°C)',
                tag: 'Tahan 4 Hari',
                desc:
                    'Simpan di bagian dalam kulkas, jangan di pintu kulkas karena suhunya tidak stabil akibat sering dibuka-tutup.',
              ),
              const SizedBox(height: 12),
              _buildTempCard(
                icon: Icons.ac_unit,
                iconColor: const Color(0xFF0D9488),
                bgColor: const Color(0xFFF0FDF4),
                borderColor: const Color(0xFFDCFCE7),
                title: 'Freezer (Kulkas 2 Pintu)',
                tag: 'Tahan 3-6 Bulan',
                desc:
                    'Suhu stabil di bawah -18°C sangat baik untuk stok jangka panjang bagi Bunda pekerja.',
              ),
              const SizedBox(height: 24),

              // Section 2: Wadah & FIFO (2 Cards Side-by-Side/Grid style)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Card 1: FIFO
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xFFF1F5F9)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.label,
                              color: primaryColor,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Manajemen Stok (FIFO)',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildSubBullet(
                          'Selalu tempelkan label tanggal dan waktu pemerasan ASI.',
                        ),
                        const SizedBox(height: 8),
                        _buildSubBullet(
                          'Terapkan metode FIFO (First In First Out): berikan ASI yang paling lama disimpan terlebih dahulu.',
                        ),
                        const SizedBox(height: 8),
                        _buildSubBullet(
                          'Jangan isi botol terlalu penuh. Sisakan ruang sekitar 2-3 cm karena volume ASI memuai saat dibekukan.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Card 2: Wadah
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xFFF1F5F9)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.water_drop,
                              color: secondaryColor,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Wadah ASIP yang Aman',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildSubBulletRich(
                          'Botol Kaca Steril: ',
                          'Paling direkomendasikan karena mudah dibersihkan dan nutrisi ASI tidak menempel di kaca.',
                        ),
                        const SizedBox(height: 8),
                        _buildSubBulletRich(
                          'Botol Plastik Bebas BPA: ',
                          'Pilih plastik tebal berkode daur ulang nomor 5 (PP).',
                        ),
                        const SizedBox(height: 8),
                        _buildSubBulletRich(
                          'Kantong ASI: ',
                          'Praktis, hemat tempat, sekali pakai, dan pastikan bersertifikat BPA-free.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTempCard({
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required Color borderColor,
    required String title,
    required String tag,
    required String desc,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.01),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: borderColor),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF064673),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        tag,
                        style: GoogleFonts.manrope(
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                          color: iconColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: GoogleFonts.manrope(
                    fontSize: 11.5,
                    color: const Color(0xFF5A7182),
                    height: 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubBullet(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '• ',
          style: TextStyle(
            color: Color(0xFF064673),
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.manrope(
              fontSize: 11.5,
              color: const Color(0xFF5A7182),
              height: 1.4,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubBulletRich(String title, String body) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '• ',
          style: TextStyle(
            color: Color(0xFF30628A),
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: title,
              style: GoogleFonts.manrope(
                fontSize: 11.5,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
              ),
              children: [
                TextSpan(
                  text: body,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF5A7182),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
