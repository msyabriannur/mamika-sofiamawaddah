import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KonsultanLaktasiScreen extends StatelessWidget {
  const KonsultanLaktasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF064673);
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
              // Intro
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Konsultan Laktasi & Asuhan Mandiri',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Panduan lengkap untuk meningkatkan kualitas dan kuantitas ASI demi si buah hati.',
                    style: GoogleFonts.manrope(
                      fontSize: 13,
                      color: textOnSurfaceVariant,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Consultation Image
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFE2EFFC), width: 1.5),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/images/consultation.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),

              // Peran Konsultan Laktasi Card
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color(0xFFE2EFFC),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.support_agent,
                            color: primaryColor,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Peran Konsultan Laktasi',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Konsultan laktasi adalah tenaga profesional kesehatan tersertifikasi yang membantu ibu mengatasi hambatan menyusui seperti puting datar/tenggelam, bayi bingung puting, tongue-tie, mastitis, atau proses relaktasi.',
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        color: textOnSurfaceVariant,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Asuhan Mandiri Section
              Text(
                'Asuhan Mandiri untuk ASI',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 14),

              // List of activities
              _buildMandiriItem(
                icon: Icons.sync,
                iconColor: const Color(0xFFE07A5F),
                bgColor: const Color(0xFFFDE2E4),
                title: 'Prinsip Supply & Demand',
                desc:
                    'Semakin sering payudara dikosongkan (disusui/dipompa), semakin banyak ASI yang diproduksi secara alami.',
              ),
              const SizedBox(height: 12),
              _buildMandiriItem(
                icon: Icons.child_care,
                iconColor: const Color(0xFF5E8C83),
                bgColor: const Color(0xFFE2ECE9),
                title: 'Skin-to-Skin Contact',
                desc:
                    'Sering mendekap bayi tanpa pakaian di dada ibu untuk memicu produksi hormon oksitosin alami.',
              ),
              const SizedBox(height: 12),
              _buildMandiriItem(
                icon: Icons.volunteer_activism,
                iconColor: const Color(0xFF8C5EAD),
                bgColor: const Color(0xFFE9E1F0),
                title: 'Pijat Oksitosin',
                desc:
                    'Pijat punggung sepanjang tulang belakang untuk memberikan rasa rileks dan melancarkan pancaran ASI.',
              ),
              const SizedBox(height: 12),
              _buildMandiriItem(
                icon: Icons.self_improvement,
                iconColor: const Color(0xFFAD8B5E),
                bgColor: const Color(0xFFF0E6D2),
                title: 'Kelola Stres & Istirahat',
                desc:
                    'Stres dapat menghambat pancaran ASI. Ibu wajib tidur saat bayi sedang tidur untuk pemulihan optimal.',
              ),
              const SizedBox(height: 12),
              _buildMandiriItem(
                icon: Icons.eco,
                iconColor: const Color(0xFF2B5E8C),
                bgColor: const Color(0xFFDDE9F3),
                title: 'ASI Booster Alami',
                desc:
                    'Konsumsi daun katuk, daun kelor, fenugreek, atau kacang-kacangan secara rutin dengan menu gizi seimbang.',
              ),


              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMandiriItem({
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String title,
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
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF064673),
                  ),
                ),
                const SizedBox(height: 2),
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
}
