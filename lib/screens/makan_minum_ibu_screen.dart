import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class MakanMinumIbuScreen extends StatefulWidget {
  const MakanMinumIbuScreen({super.key});

  @override
  State<MakanMinumIbuScreen> createState() => _MakanMinumIbuScreenState();
}

class _MakanMinumIbuScreenState extends State<MakanMinumIbuScreen> {
  int _glassesDrunk = 0;
  final int _targetGlasses = 8;
  final double _targetLiters = 3.0;

  void _toggleGlass(int index) {
    setState(() {
      if (index < _glassesDrunk) {
        _glassesDrunk = index;
      } else {
        _glassesDrunk = index + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF064673);
    const textOnSurfaceVariant = Color(0xFF5A7182);
    const waterColor = Color(0xFF38BDF8);

    double currentLiters = (_glassesDrunk / _targetGlasses) * _targetLiters;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: primaryColor),
        title: Text(
          'Makan & Minum Ibu',
          style: GoogleFonts.plusJakartaSans(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Water Tracker Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: waterColor.withValues(alpha: 0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: waterColor.withValues(alpha: 0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Target Air Minum',
                            style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: textOnSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$_targetLiters Liter / Hari',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.water_drop,
                        color: waterColor,
                        size: 32,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Progress Circle
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: CircularProgressIndicator(
                          value: _glassesDrunk / _targetGlasses,
                          strokeWidth: 12,
                          backgroundColor: waterColor.withValues(alpha: 0.1),
                          valueColor: const AlwaysStoppedAnimation<Color>(waterColor),
                          strokeCap: StrokeCap.round,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            '$_glassesDrunk/$_targetGlasses',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              color: primaryColor,
                            ),
                          ),
                          Text(
                            'Gelas',
                            style: GoogleFonts.manrope(
                              fontSize: 14,
                              color: textOnSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  Text(
                    'Terkumpul: ${currentLiters.toStringAsFixed(1)} L',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: waterColor,
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Glasses Grid
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: List.generate(_targetGlasses, (index) {
                      bool isFilled = index < _glassesDrunk;
                      return GestureDetector(
                        onTap: () => _toggleGlass(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 50,
                          height: 60,
                          decoration: BoxDecoration(
                            color: isFilled ? waterColor.withValues(alpha: 0.15) : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isFilled ? waterColor : Colors.grey.withValues(alpha: 0.3),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              isFilled ? Icons.local_drink : Icons.local_drink_outlined,
                              color: isFilled ? waterColor : Colors.grey,
                              size: 28,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  
                  const SizedBox(height: 16),
                  Text(
                    'Sentuh gelas untuk menambah',
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      color: textOnSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Healthy Meals Section
            Text(
              'Visualisasi Porsi Makan (Isi Piringku)',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Terapkan rasio porsi ini untuk sarapan, makan siang, dan makan malam.',
              style: GoogleFonts.manrope(
                fontSize: 13,
                color: textOnSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            
            Container(
              height: 320,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFF1F5F9)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PieChart(
                          PieChartData(
                            sectionsSpace: 4,
                            centerSpaceRadius: 35,
                            sections: [
                              PieChartSectionData(
                                color: Colors.green.shade400,
                                value: 33.3,
                                title: 'Sayuran\n33%',
                                radius: 75,
                                titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              PieChartSectionData(
                                color: Colors.orange.shade400,
                                value: 33.3,
                                title: 'Karbo\n33%',
                                radius: 75,
                                titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              PieChartSectionData(
                                color: Colors.red.shade400,
                                value: 16.7,
                                title: 'Protein\n17%',
                                radius: 65,
                                titleStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              PieChartSectionData(
                                color: Colors.purple.shade300,
                                value: 16.7,
                                title: 'Buah\n17%',
                                radius: 65,
                                titleStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        // Plate center icon
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const Icon(Icons.restaurant, color: Color(0xFF064673), size: 24),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildLegend(Colors.green.shade400, 'Sayur'),
                      _buildLegend(Colors.orange.shade400, 'Karbohidrat'),
                      _buildLegend(Colors.red.shade400, 'Protein (Lauk)'),
                      _buildLegend(Colors.purple.shade300, 'Buah-buahan'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.manrope(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF5A7182),
          ),
        ),
      ],
    );
  }
}
