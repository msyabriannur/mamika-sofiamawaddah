import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ManfaatMenyusuiScreen extends StatelessWidget {
  const ManfaatMenyusuiScreen({super.key});

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
              Container(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
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
                        'Informasi Kesehatan',
                        style: GoogleFonts.manrope(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Manfaat Menyusui Multi Aspek',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Menyusui bukan sekadar pemberian nutrisi, melainkan investasi kesehatan jangka panjang dan ikatan emosional yang tak tergantikan bagi Ibu dan Si Kecil.',
                      style: GoogleFonts.manrope(
                        fontSize: 13,
                        color: textOnSurfaceVariant,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Image Container
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/manfaat_menyusui.png',
                          fit: BoxFit.fitWidth,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                height: 220,
                                color: const Color(0xFFE2EFFC),
                                child: const Icon(
                                  Icons.favorite,
                                  size: 50,
                                  color: primaryColor,
                                ),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Benefit cards (Bento Style)
              // 1. Manfaat bagi Bayi
              _buildBenefitCard(
                title: 'Manfaat bagi Bayi',
                titleColor: secondaryColor,
                borderColor: primaryColor,
                icon: Icons.health_and_safety,
                items: [
                  'Nutrisi ideal dan mudah dicerna oleh lambung bayi.',
                  'Antibodi alami (Kolostrum) melawan infeksi & virus.',
                  'Mengandung DHA/AA yang merangsang perkembangan otak.',
                ],
              ),
              const SizedBox(height: 16),

              // 2. Manfaat untuk Ibu (Double card with image)
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
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE2EFFC),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.restaurant,
                        color: primaryColor,
                        size: 22,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Manfaat untuk Ibu',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildTextBullet(
                      text: 'Mengecilkan rahim pasca melahirkan.',
                    ),
                    const SizedBox(height: 6),
                    _buildTextBullet(
                      text: 'Mengurangi perdarahan nifas melahirkan.',
                    ),
                    const SizedBox(height: 6),
                    _buildTextBullet(
                      text: 'KB alami & cegah risiko kanker rahim/payudara.',
                    ),
                    const SizedBox(height: 16),

                    // Image inside benefit
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFF1F5F9)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          'assets/images/brain_development.png',
                          fit: BoxFit.fitWidth,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(height: 180, color: const Color(0xFFE2EFFC)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'DHA & AA Alami',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Kunci utama perkembangan otak dan kecerdasan anak sejak dini.',
                      style: GoogleFonts.manrope(
                        fontSize: 11,
                        color: textOnSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 3. Pemulihan Ibu
              _buildBenefitCard(
                title: 'Pemulihan Ibu',
                titleColor: primaryColor,
                borderColor: primaryColor,
                icon: Icons.healing,
                items: [
                  'Oksitosin membantu rahim kembali ke ukuran semula.',
                  'Membakar kalori ekstra untuk berat badan ideal.',
                  'Menurunkan risiko kanker payudara dan ovarium.',
                ],
              ),
              const SizedBox(height: 16),

              // 4. Ikatan Batin (Bonding)
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
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE2EFFC),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.volunteer_activism,
                        color: primaryColor,
                        size: 22,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Ikatan Batin (Bonding)',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Kontak kulit-ke-kulit (skin-to-skin) saat menyusui melepaskan hormon cinta yang mengurangi stres pada Ibu dan memberikan rasa aman yang mendalam bagi Si Kecil.',
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        color: textOnSurfaceVariant,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFF1F5F9)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          'assets/images/bonding.png',
                          fit: BoxFit.fitWidth,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(height: 180, color: const Color(0xFFE2EFFC)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Quote Section
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE2EFFC).withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      '"ASI adalah hadiah pertama dan terbaik yang bisa Ibu berikan untuk masa depan Si Kecil."',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontStyle: FontStyle.italic,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/author_sofia.jpg',
                            height: 65,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final Uri url = Uri.parse('https://scholar.google.com/citations?hl=id&user=2g0npaEAAAAJ&view');
                                if (!await launchUrl(url)) {
                                  debugPrint('Could not launch $url');
                                }
                              },
                              child: Text(
                                'Sofia Mawaddah',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Konselor Laktasi & Praktisi Kesehatan',
                              style: GoogleFonts.manrope(
                                fontSize: 10,
                                color: textOnSurfaceVariant,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBenefitCard({
    required String title,
    required Color titleColor,
    required Color borderColor,
    required IconData icon,
    required List<String> items,
  }) {
    const primaryColor = Color(0xFF064673);

    return Container(
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
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Color(0xFFE2EFFC),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primaryColor, size: 22),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: items.map((item) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Color(0xFF30628A),
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        item,
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          color: const Color(0xFF5A7182),
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextBullet({required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            color: Color(0xFF30628A),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.manrope(
              fontSize: 12,
              color: const Color(0xFF5A7182),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
