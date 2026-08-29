import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CatatanScreen extends StatelessWidget {
  final bool isStandalone;

  const CatatanScreen({super.key, this.isStandalone = false});

  @override
  Widget build(BuildContext context) {
    // Menentukan warna utama dan warna teks yang digunakan pada layar ini
    const primaryColor = Color(0xFF064673);
    const secondaryColor = Color(0xFF30628A);
    const textOnSurfaceVariant = Color(0xFF5A7182);

    Widget content = SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Intro Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Indikator Kecukupan ASI & Berat Badan',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Panduan praktis untuk memantau kesehatan dan tumbuh kembang si Kecil dengan tenang dan terukur.',
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

            // Section 1: Tanda Klinis
            Row(
              children: [
                const Icon(Icons.verified, color: primaryColor, size: 22),
                const SizedBox(width: 8),
                Text(
                  'Tanda Klinis Bayi Cukup ASI',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // 4 Grid Cards
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildClinicalCard(
                  imagePath: 'assets/images/baby_pee.png',
                  title: 'BAK (Buang Air Kecil)',
                  desc:
                      'Minimal 6 kali dalam 24 jam dengan warna urine jernih atau kuning muda.',
                  color: primaryColor,
                ),
                _buildClinicalCard(
                  imagePath: 'assets/images/baby_poop.png',
                  title: 'BAB (Buang Air Besar)',
                  desc:
                      'Teratur, warna kekuningan bertekstur lembek setelah melewati hari ke-5.',
                  color: primaryColor,
                ),
                _buildClinicalCard(
                  imagePath: 'assets/images/baby_sleeping.png',
                  title: 'Kondisi Bayi',
                  desc:
                      'Bayi tenang, kenyang, melepas puting sendiri, dan tidur pulas 2–3 jam.',
                  color: primaryColor,
                ),
                _buildClinicalCard(
                  imagePath: 'assets/images/baby_breastfeeding.png',
                  title: 'Suara Menelan',
                  desc:
                      'Terdengar bunyi menelan yang ritmis dan mantap saat bayi menyusu.',
                  color: primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 28),

            // Section 2: Weight table
            Row(
              children: [
                const Icon(Icons.scale, color: primaryColor, size: 22),
                const SizedBox(width: 8),
                Text(
                  'Kenaikan Berat Badan Minimum',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Table Container
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Table Header Banner
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'STANDAR',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: Colors.white.withValues(alpha: 0.8),
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              'Kemenkes RI / WHO',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.scale,
                          size: 32,
                          color: Colors.white.withValues(alpha: 0.35),
                        ),
                      ],
                    ),
                  ),

                  // Table Data
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1.2),
                        1: FlexColumnWidth(1.4),
                        2: FlexColumnWidth(1.6),
                      },
                      children: [
                        TableRow(
                          children: [
                            _buildTableHeaderCell('BULAN'),
                            _buildTableHeaderCell(
                              'TARGET BULANAN',
                              alignRight: true,
                            ),
                            _buildTableHeaderCell(
                              'TARGET MINGGUAN',
                              alignRight: true,
                            ),
                          ],
                        ),
                        _buildTableRow('Bulan 1', '800g', '200g/minggu'),
                        _buildTableRow('Bulan 2', '900g', '225g/minggu'),
                        _buildTableRow('Bulan 3', '800g', '200g/minggu'),
                        _buildTableRow('Bulan 4', '600g', '150g/minggu'),
                        _buildTableRow('Bulan 5', '500g', '125g/minggu'),
                        _buildTableRow('Bulan 6', '400g', '100g/minggu'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Progress Bar Visual Concept
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tren Kenaikan Minimum (6 Bulan Pertama)',
                        style: GoogleFonts.manrope(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        'Total: 4.0 kg',
                        style: GoogleFonts.manrope(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Progress segments
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 14,
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 200,
                            child: Container(color: primaryColor),
                          ),
                          Expanded(
                            flex: 225,
                            child: Container(color: secondaryColor),
                          ),
                          Expanded(
                            flex: 200,
                            child: Container(
                              color: primaryColor.withValues(alpha: 0.7),
                            ),
                          ),
                          Expanded(
                            flex: 150,
                            child: Container(
                              color: secondaryColor.withValues(alpha: 0.7),
                            ),
                          ),
                          Expanded(
                            flex: 125,
                            child: Container(
                              color: primaryColor.withValues(alpha: 0.4),
                            ),
                          ),
                          Expanded(
                            flex: 100,
                            child: Container(color: Colors.grey.shade300),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Label row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildProgressLabel('B1'),
                      _buildProgressLabel('B2'),
                      _buildProgressLabel('B3'),
                      _buildProgressLabel('B4'),
                      _buildProgressLabel('B5'),
                      _buildProgressLabel('B6'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Footer / Disclaimer
            Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    final Uri url = Uri.parse('https://www.who.int/tools/child-growth-standards');
                    if (!await launchUrl(url)) {
                      debugPrint('Could not launch $url');
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: secondaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.info, color: primaryColor, size: 16),
                        const SizedBox(width: 8),
                        Text(
                          'Sumber: Standar Kemenkes RI/WHO',
                          style: GoogleFonts.manrope(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Data ini merupakan referensi umum. Jika terdapat kekhawatiran khusus mengenai kondisi bayi, segera konsultasikan dengan tenaga kesehatan profesional.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    fontSize: 11,
                    color: textOnSurfaceVariant,
                    height: 1.5,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );

    if (isStandalone) {
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
            'Catatan',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ),
        body: content,
      );
    }

    return content;
  }

  // Fungsi untuk membuat kartu informasi tanda klinis bayi (seperti BAK, BAB, dll)
  Widget _buildClinicalCard({
    required String imagePath,
    required String title,
    required String desc,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.01),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: GoogleFonts.manrope(
              fontSize: 13,
              color: const Color(0xFF5A7182),
              height: 1.4,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeaderCell(String text, {bool alignRight = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
      child: Text(
        text,
        textAlign: alignRight ? TextAlign.right : TextAlign.left,
        style: GoogleFonts.manrope(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF94A3B8),
        ),
      ),
    );
  }

  // Fungsi pembantu untuk membuat baris pada tabel standar kenaikan berat badan
  TableRow _buildTableRow(String month, String target, String weekly) {
    const primaryColor = Color(0xFF064673);
    const secondaryColor = Color(0xFF30628A);

    return TableRow(
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: const BoxDecoration(
              color: Color(0xFFF8FAFC),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Text(
              month,
              style: GoogleFonts.manrope(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            color: const Color(0xFFF8FAFC),
            child: Text(
              target,
              textAlign: TextAlign.right,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: primaryColor,
              ),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: const BoxDecoration(
              color: Color(0xFFF8FAFC),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Text(
              weekly,
              textAlign: TextAlign.right,
              style: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: secondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        text,
        style: GoogleFonts.manrope(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF64748B),
        ),
      ),
    );
  }
}
