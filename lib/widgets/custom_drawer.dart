import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/guides/manfaat_menyusui_screen.dart';
import '../screens/guides/teknik_menyusui_screen.dart';
import '../screens/guides/konsultan_laktasi_screen.dart';
import '../screens/guides/panduan_simpan_asi_screen.dart';
import '../screens/guides/mengukur_asi_screen.dart';
import '../screens/catatan_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF064673);
    const textOnSurfaceVariant = Color(0xFF5A7182);

    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Drawer Header
          SafeArea(
            bottom: false,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFF1F5F9)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Menu Utama',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: textOnSurfaceVariant),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),

          // Drawer Navigation List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              children: [
                _buildDrawerItem(
                  context: context,
                  icon: Icons.auto_awesome,
                  title: 'Manfaat Menyusui',
                  destination: const ManfaatMenyusuiScreen(),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.baby_changing_station,
                  title: 'Teknik Menyusui',
                  destination: const TeknikMenyusuiScreen(),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.medical_services,
                  title: 'Solusi Payudara Bengkak',
                  destination: const TeknikMenyusuiScreen(scrollToSolusi: true),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.trending_up,
                  title: 'Tanda Cukup ASI',
                  destination: const CatatanScreen(isStandalone: true),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.support_agent,
                  title: 'Konsultasi Laktasi',
                  destination: const KonsultanLaktasiScreen(),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.work,
                  title: 'Panduan Simpan ASI',
                  destination: const PanduanSimpanAsiScreen(),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.show_chart,
                  title: 'Mengukur Produksi ASI',
                  destination: const MengukurAsiScreen(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(color: Color(0xFFF1F5F9), thickness: 1),
                ),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  leading: const Icon(Icons.info_outline, color: Color(0xFF064673), size: 20),
                  title: Text(
                    'Tentang Aplikasi',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                  hoverColor: const Color(0xFFE2EFFC),
                  onTap: () {
                    Navigator.pop(context); // Close drawer
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        title: Row(
                          children: [
                            const Icon(Icons.pregnant_woman, size: 32, color: Color(0xFF064673)),
                            const SizedBox(width: 12),
                            Text(
                              'MAMIKA',
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF064673),
                              ),
                            ),
                          ],
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Versi 1.0.0', style: GoogleFonts.manrope(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 12),
                            Text(
                              'MAMIKA (Mama Pintar Menyusui dan Konsultasi Anak) adalah aplikasi panduan dan edukasi komprehensif bagi para ibu untuk mendukung keberhasilan menyusui dan pemantauan tumbuh kembang anak.',
                              style: GoogleFonts.manrope(fontSize: 13, height: 1.5, color: const Color(0xFF5A7182)),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Copyright © 2026 Sofia Mawaddah.\nSemua hak cipta dilindungi.',
                              style: GoogleFonts.manrope(fontSize: 12, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              'TUTUP',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF064673),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  leading: const Icon(Icons.exit_to_app, color: Colors.redAccent, size: 20),
                  title: Text(
                    'Keluar Aplikasi',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent,
                    ),
                  ),
                  hoverColor: Colors.red.shade50,
                  onTap: () {
                    SystemNavigator.pop();
                  },
                ),
              ],
            ),
          ),

          // Footer
          Container(
            padding: const EdgeInsets.all(20),
            color: const Color(0xFFF8FAFC),
            child: Center(
              child: Text(
                'MAMIKA v1.0',
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF30628A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Widget destination,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Icon(icon, color: const Color(0xFF064673), size: 20),
        title: Text(
          title,
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1E293B),
          ),
        ),
        hoverColor: const Color(0xFFE2EFFC),
        splashColor: const Color(0xFFE2EFFC),
        onTap: () {
          // Close drawer
          Navigator.of(context).pop();
          // Navigate to destination
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}
