import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class PertumbuhanBayiScreen extends StatefulWidget {
  const PertumbuhanBayiScreen({super.key});

  @override
  State<PertumbuhanBayiScreen> createState() => _PertumbuhanBayiScreenState();
}

class _PertumbuhanBayiScreenState extends State<PertumbuhanBayiScreen> {
  static const primaryColor = Color(0xFF064673);
  static const textOnSurfaceVariant = Color(0xFF5A7182);

  final TextEditingController _weightController = TextEditingController();
  
  // Data starts empty as requested
  final List<Map<String, dynamic>> _userGrowthData = [];

  String _fuzzyWarningMessage = '';
  Color _fuzzyWarningColor = Colors.transparent;

  int _selectedMonth = 0; // Default selected month for dropdown

  @override
  void initState() {
    super.initState();
    _evaluateFuzzyLogic();
  }

  void _addWeightData() {
    if (_weightController.text.isEmpty) return;

    final double? newWeight = double.tryParse(_weightController.text);
    if (newWeight == null) return;

    setState(() {
      // Check if data for this month already exists, update if true, else add
      final existingIndex = _userGrowthData.indexWhere((d) => d['month'] == _selectedMonth);
      if (existingIndex != -1) {
        _userGrowthData[existingIndex]['weight'] = newWeight.toInt();
      } else {
        _userGrowthData.add({'month': _selectedMonth, 'weight': newWeight.toInt()});
      }
      
      // Sort data chronologically by month
      _userGrowthData.sort((a, b) => (a['month'] as int).compareTo(b['month'] as int));

      _weightController.clear();
      
      // Auto-increment dropdown selection for next input (if not max)
      if (_selectedMonth < 24) {
        _selectedMonth++;
      }
      
      _evaluateFuzzyLogic();
    });
    
    FocusScope.of(context).unfocus();
  }

  void _resetData() {
    setState(() {
      _userGrowthData.clear();
      _selectedMonth = 0;
      _fuzzyWarningMessage = '';
      _fuzzyWarningColor = Colors.transparent;
      _weightController.clear();
    });
  }

  void _evaluateFuzzyLogic() {
    if (_userGrowthData.length < 2) {
      _fuzzyWarningMessage = _userGrowthData.isEmpty 
          ? "Grafik kosong. Masukkan berat badan pertama bayi Anda."
          : "Masukkan data satu bulan lagi untuk melihat analisa kenaikan berat badan.";
      _fuzzyWarningColor = Colors.blueGrey;
      return;
    }

    // Get the last two data points
    final curr = _userGrowthData.last;
    final prev = _userGrowthData[_userGrowthData.length - 2];
    
    final int currentWeight = curr['weight'];
    final int prevWeight = prev['weight'];
    final int diffMonths = curr['month'] - prev['month'];

    if (diffMonths <= 0) return; // Should not happen due to sorting, but just in case

    // Calculate weight gain per week (assuming 4 weeks per month for simplicity)
    final double diffWeeks = diffMonths * 4.0;
    final double weightGainPerWeek = (currentWeight - prevWeight) / diffWeeks;

    if (weightGainPerWeek >= 200) {
      _fuzzyWarningMessage = "Naik ~${weightGainPerWeek.toInt()}gr/minggu: Aman, mencukupi kebutuhan ASI bayi.";
      _fuzzyWarningColor = Colors.green[700]!;
    } else if (weightGainPerWeek < 100) {
      _fuzzyWarningMessage = "Naik hanya ~${weightGainPerWeek.toInt()}gr/minggu: Peringatan, cek perlekatan dan Frekuensi menyusui!";
      _fuzzyWarningColor = Colors.red[700]!;
    } else {
      _fuzzyWarningMessage = "Naik ~${weightGainPerWeek.toInt()}gr/minggu: Cukup, pantau terus pertumbuhan bayi.";
      _fuzzyWarningColor = Colors.orange[700]!;
    }
  }

  // WHO Standard Curve (0 - 24 months, Median Boys, Weight in grams)
  List<FlSpot> _getWhoStandardCurve() {
    return const [
      FlSpot(0, 3300),
      FlSpot(2, 5600),
      FlSpot(4, 7000),
      FlSpot(6, 7900),
      FlSpot(9, 8900),
      FlSpot(12, 9600),
      FlSpot(15, 10300),
      FlSpot(18, 10900),
      FlSpot(21, 11500),
      FlSpot(24, 12200),
    ];
  }

  List<FlSpot> _getUserDataCurve() {
    return _userGrowthData.map((data) {
      return FlSpot(
        (data['month'] as int).toDouble(),
        (data['weight'] as int).toDouble(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // Generate dropdown items for 0-24 months
    final List<DropdownMenuItem<int>> monthItems = List.generate(25, (index) {
      return DropdownMenuItem(
        value: index,
        child: Text(index == 0 ? 'Lahir (0 Bln)' : 'Bulan ke-$index'),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: primaryColor),
        title: Text(
          'Pertumbuhan Bayi',
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
            // Warning Box (Fuzzy Logic)
            if (_fuzzyWarningMessage.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _fuzzyWarningColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _fuzzyWarningColor.withValues(alpha: 0.5),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      _fuzzyWarningColor == Colors.red[700] 
                          ? Icons.warning_amber_rounded 
                          : _fuzzyWarningColor == Colors.blueGrey
                              ? Icons.info_outline
                              : Icons.check_circle_outline,
                      color: _fuzzyWarningColor,
                      size: 28,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        _fuzzyWarningMessage,
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: _fuzzyWarningColor,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // Chart Box
            Container(
              height: 350,
              padding: const EdgeInsets.fromLTRB(16, 24, 24, 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Kurva Berat Badan WHO (0-24 Bulan)',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(show: true, drawVerticalLine: false),
                        titlesData: FlTitlesData(
                          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              interval: 4,
                              getTitlesWidget: (value, meta) {
                                return SideTitleWidget(
                                  meta: meta,
                                  child: Text(
                                    'Bl ${value.toInt()}',
                                    style: GoogleFonts.manrope(fontSize: 10, color: textOnSurfaceVariant),
                                  ),
                                );
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 2000,
                              reservedSize: 45,
                              getTitlesWidget: (value, meta) {
                                return SideTitleWidget(
                                  meta: meta,
                                  child: Text(
                                    '${value.toInt()}g',
                                    style: GoogleFonts.manrope(fontSize: 10, color: textOnSurfaceVariant),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        borderData: FlBorderData(show: false),
                        minX: 0,
                        maxX: 24,
                        minY: 2000,
                        maxY: 13000,
                        lineBarsData: [
                          // WHO Standard Line
                          LineChartBarData(
                            spots: _getWhoStandardCurve(),
                            isCurved: true,
                            color: Colors.grey.withValues(alpha: 0.5),
                            barWidth: 3,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            dashArray: [5, 5],
                          ),
                          // User Data Line
                          if (_userGrowthData.isNotEmpty)
                            LineChartBarData(
                              spots: _getUserDataCurve(),
                              isCurved: false,
                              color: primaryColor,
                              barWidth: 4,
                              isStrokeCapRound: true,
                              dotData: FlDotData(
                                show: true,
                                getDotPainter: (spot, percent, barData, index) {
                                  return FlDotCirclePainter(
                                    radius: 4,
                                    color: Colors.white,
                                    strokeWidth: 2,
                                    strokeColor: primaryColor,
                                  );
                                },
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                color: primaryColor.withValues(alpha: 0.1),
                              ),
                            ),
                        ],
                        lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                            getTooltipColor: (touchedSpot) => primaryColor,
                            getTooltipItems: (touchedSpots) {
                              return touchedSpots.map((LineBarSpot touchedSpot) {
                                final textStyle = const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                );
                                return LineTooltipItem(
                                  '${touchedSpot.y.toInt()} gr',
                                  textStyle,
                                );
                              }).toList();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Legend
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 12, height: 4, color: primaryColor),
                      const SizedBox(width: 4),
                      Text('Bayi Anda', style: GoogleFonts.manrope(fontSize: 12)),
                      const SizedBox(width: 16),
                      Container(width: 12, height: 4, color: Colors.grey.withValues(alpha: 0.5)),
                      const SizedBox(width: 4),
                      Text('Standar WHO', style: GoogleFonts.manrope(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Input Form
            Text(
              'Input Berat Badan Baru',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),
            
            // Dropdown Usia Bayi
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: _selectedMonth,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down, color: primaryColor),
                  style: GoogleFonts.manrope(fontSize: 14, color: Colors.black87),
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedMonth = newValue;
                      });
                    }
                  },
                  items: monthItems,
                ),
              ),
            ),
            const SizedBox(height: 12),
            
            // Text Input & Submit
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Berat Badan (gram)',
                      labelStyle: GoogleFonts.manrope(fontSize: 14),
                      hintText: 'Misal: 4200',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: primaryColor, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _addWeightData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text('Hitung', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: _resetData,
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Reset Data', style: TextStyle(fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red.shade500,
                side: BorderSide(color: Colors.red.shade200),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '* Pilih usia pada dropdown, lalu masukkan berat badan untuk memunculkan analisis.',
              style: GoogleFonts.manrope(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: textOnSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
