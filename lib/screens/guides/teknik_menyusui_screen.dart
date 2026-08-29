import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeknikMenyusuiScreen extends StatefulWidget {
  final bool scrollToSolusi;

  const TeknikMenyusuiScreen({super.key, this.scrollToSolusi = false});

  @override
  State<TeknikMenyusuiScreen> createState() => _TeknikMenyusuiScreenState();
}

class _TeknikMenyusuiScreenState extends State<TeknikMenyusuiScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _solusiKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (widget.scrollToSolusi) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Allow rendering to finish, then scroll to bottom or key
        Future.delayed(const Duration(milliseconds: 300), () {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
            );
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Teknik Menyusui & Perlekatan',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Membangun fondasi menyusui yang nyaman dan sehat untuk Ibu dan sang buah hati.',
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

              // Image & Ideal positioning
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFF1F5F9)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/breastfeeding_position.png',
                        fit: BoxFit.fitWidth,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 220,
                          color: const Color(0xFFE2EFFC),
                          child: const Icon(
                            Icons.baby_changing_station,
                            size: 50,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE2EFFC),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.verified,
                              color: primaryColor,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Posisi Dasar yang Ideal',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Pastikan Ibu duduk dengan punggung bersandar tegak namun rileks. Gunakan bantal menyusui jika diperlukan untuk menyangga berat tubuh bayi tanpa membuat lengan Ibu tegang.',
                                  style: GoogleFonts.manrope(
                                    fontSize: 12,
                                    color: textOnSurfaceVariant,
                                    height: 1.4,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Perlekatan (Latch-On)
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9).withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFE2EFFC)),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: primaryColor,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Perlekatan (Latch-On) yang Benar',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE2EFFC), width: 1.5),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        'assets/images/latch_on.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.9,
                      children: [
                        _buildLatchCard(1, 'Mulut Terbuka Sangat Lebar'),
                        _buildLatchCard(2, 'Sebagian Besar Areola Masuk'),
                        _buildLatchCard(3, 'Bibir Membuka Ke Luar (Dower)'),
                        _buildLatchCard(4, 'Dagu Menempel & Hidung Bebas'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Image Posisi Menyusui
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFE2EFFC), width: 1.5),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/images/posisi_menyusui.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),

              // Posisi Menyusui Checklist
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
                          Icons.baby_changing_station,
                          color: primaryColor,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Posisi Menyusui yang Benar',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildChecklistItem(
                      'Satu Garis',
                      'Kepala, leher, dan tubuh bayi berada dalam satu garis lurus.',
                    ),
                    const SizedBox(height: 12),
                    _buildChecklistItem(
                      'Hadap Dada',
                      'Wajah bayi menghadap payudara ibu dengan hidung berada di depan puting.',
                    ),
                    const SizedBox(height: 12),
                    _buildChecklistItem(
                      'Dekapan Rapat',
                      'Perut bayi menempel langsung pada perut ibu (perut ketemu perut).',
                    ),
                    const SizedBox(height: 12),
                    _buildChecklistItem(
                      'Sangga Penuh',
                      'Ibu menyangga seluruh tubuh bayi, bukan hanya kepala atau bahu.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Solusi Masalah Umum (Scroll Anchor)
              Container(
                key: _solusiKey,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withValues(alpha: 0.1),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.healing,
                          color: Colors.white,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Solusi Masalah Umum',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Puting Lecet
                    _buildProblemSolutionCard(
                      icon: Icons.healing,
                      iconColor: const Color(0xFFFDE047),
                      title: 'Puting Sakit atau Lecet',
                      desc:
                          'Koreksi perlekatan segera. Oleskan sedikit ASI pada puting setelah menyusui. Hindari penggunaan sabun pada area puting.',
                    ),
                    const SizedBox(height: 12),

                    // Payudara Bengkak
                    _buildProblemSolutionCard(
                      icon: Icons.water_drop,
                      iconColor: const Color(0xFF67E8F9),
                      title: 'Payudara Bengkak',
                      desc:
                          'Susui bayi lebih sering. Kompres hangat atau pijat sebelum menyusui, gunakan kompres dingin sesudahnya. Perah dengan tangan jika payudara terasa keras.',
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

  Widget _buildLatchCard(int num, String label) {
    const primaryColor = Color(0xFF064673);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: Color(0xFFE2EFFC),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              num.toString(),
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 10.5,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChecklistItem(String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check_circle, color: Color(0xFF30628A), size: 20),
        const SizedBox(width: 12),
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
    );
  }

  Widget _buildProblemSolutionCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String desc,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 20,
              ),
              const SizedBox(width: 6),
              Text(
                title,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            desc,
            style: GoogleFonts.manrope(
              fontSize: 11,
              color: Colors.white.withValues(alpha: 0.9),
              height: 1.4,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
