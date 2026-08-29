import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'guides/manfaat_menyusui_screen.dart';
import 'guides/teknik_menyusui_screen.dart';
import 'guides/konsultan_laktasi_screen.dart';
import 'guides/panduan_simpan_asi_screen.dart';
import 'guides/mengukur_asi_screen.dart';
import 'guides/cara_menyapih_screen.dart';

class PanduanScreen extends StatelessWidget {
  const PanduanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF064673);
    const textOnSurfaceVariant = Color(0xFF5A7182);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Intro
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pilih Topik Panduan',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Temukan berbagai informasi dan teknik menyusui yang divalidasi oleh konsultan laktasi profesional.',
                    style: GoogleFonts.manrope(
                      fontSize: 13,
                      color: textOnSurfaceVariant,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Guide Buttons
              _buildGuideCard(
                context: context,
                title: 'Manfaat Menyusui Multi-Aspek',
                subtitle: 'Kesehatan Ibu & Si Kecil',
                icon: Icons.favorite,
                iconColor: const Color(0xFF1A7F75),
                bgColor: const Color(0xFFF0FAF9),
                borderColor: const Color(0xFFD1F2EF),
                destination: const ManfaatMenyusuiScreen(),
              ),
              const SizedBox(height: 12),
              _buildGuideCard(
                context: context,
                title: 'Teknik Menyusui & Solusi Payudara Bengkak',
                subtitle: 'Langkah demi Langkah',
                icon: Icons.verified,
                iconColor: const Color(0xFF2B5E8C),
                bgColor: const Color(0xFFF0F7FF),
                borderColor: const Color(0xFFD6E9F7),
                destination: const TeknikMenyusuiScreen(),
              ),
              const SizedBox(height: 12),
              _buildGuideCard(
                context: context,
                title: 'Konsultan Laktasi & Asuhan ASI',
                subtitle: 'Bantuan & Stimulasi Produksi',
                icon: Icons.support_agent,
                iconColor: const Color(0xFF6A4BB2),
                bgColor: const Color(0xFFF9F5FF),
                borderColor: const Color(0xFFF0E6FF),
                destination: const KonsultanLaktasiScreen(),
              ),
              const SizedBox(height: 12),
              _buildGuideCard(
                context: context,
                title: 'Panduan Menyimpan ASI Ibu Pekerja',
                subtitle: 'Manajemen Stok & Wadah ASIP',
                icon: Icons.inventory_2,
                iconColor: const Color(0xFFB2701A),
                bgColor: const Color(0xFFFFF9F2),
                borderColor: const Color(0xFFFFEDD6),
                destination: const PanduanSimpanAsiScreen(),
              ),
              const SizedBox(height: 12),
              _buildGuideCard(
                context: context,
                title: 'Cara Mengukur Peningkatan ASI',
                subtitle: 'Indikator Keberhasilan Klinis',
                icon: Icons.show_chart,
                iconColor: const Color(0xFF5E8C2B),
                bgColor: const Color(0xFFF7F9F5),
                borderColor: const Color(0xFFEDF2E9),
                destination: const MengukurAsiScreen(),
              ),
              const SizedBox(height: 12),
              _buildGuideCard(
                context: context,
                title: 'Cara Menyapih yang Bijak',
                subtitle: 'Transisi Weaning with Love',
                icon: Icons.child_care,
                iconColor: const Color(0xFFB21A6B),
                bgColor: const Color(0xFFFFF5F9),
                borderColor: const Color(0xFFFFE9F2),
                destination: const CaraMenyapihScreen(),
              ),

              const SizedBox(height: 28),

              // Bottom Illustration
              Center(
                child: Opacity(
                  opacity: 0.9,
                  child: Container(
                    height: 140,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/images/gentle_weaning.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGuideCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required Color borderColor,
    required Widget destination,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => destination));
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 1.5),
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
          children: [
            // Icon container
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: borderColor.withValues(alpha: 0.5)),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            // Text area
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.manrope(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: iconColor.withValues(alpha: 0.85),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right,
              color: iconColor.withValues(alpha: 0.4),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
