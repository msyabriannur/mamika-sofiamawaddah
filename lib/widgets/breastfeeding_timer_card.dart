import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';

class BreastfeedingTimerCard extends StatefulWidget {
  const BreastfeedingTimerCard({super.key});

  @override
  State<BreastfeedingTimerCard> createState() => _BreastfeedingTimerCardState();
}

class _BreastfeedingTimerCardState extends State<BreastfeedingTimerCard> {
  static const primaryColor = Color(0xFF064673);
  static const secondaryColor = Color(0xFF30628A);
  static const textOnSurfaceVariant = Color(0xFF5A7182);

  final int _totalSeconds = 2 * 60 * 60; // 2 hours default
  int _remainingSeconds = 2 * 60 * 60;
  Timer? _timer;
  
  String? _selectedSide; // 'Kiri' or 'Kanan'
  bool _isLocked = false;
  late DateTime _nextFeedingTime;

  @override
  void initState() {
    super.initState();
    _nextFeedingTime = DateTime.now().add(Duration(seconds: _totalSeconds));
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer?.cancel();
          hasNotification.value = true;
          _showCompletionSnackbar();
        }
      });
    });
  }

  void _showCompletionSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Waktu menyusui untuk sisi ${_selectedSide ?? ''} telah selesai.'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _selectSide(String side) {
    if (_isLocked) return;
    
    setState(() {
      _selectedSide = side;
      _remainingSeconds = _totalSeconds; // Reset timer when switching sides
      _nextFeedingTime = DateTime.now().add(Duration(seconds: _totalSeconds));
      _startTimer();
    });
  }

  void _toggleLock() {
    setState(() {
      _isLocked = !_isLocked;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE2EFFC).withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: const Color(0xFFE2EFFC).withValues(alpha: 0.9),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.history,
                          color: secondaryColor,
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Terakhir Menyusui',
                          style: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: secondaryColor,
                          ),
                        ),
                        const Spacer(),
                        // Lock Button
                        IconButton(
                          onPressed: _toggleLock,
                          icon: Icon(
                            _isLocked ? Icons.lock : Icons.lock_open,
                            color: _isLocked ? Colors.redAccent : secondaryColor,
                            size: 20,
                          ),
                          tooltip: _isLocked ? 'Buka Kunci' : 'Kunci Pilihan',
                        ),
                      ],
                    ),
                    Text(
                      _selectedSide != null ? 'Sedang Menyusui' : 'Belum Mulai',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildSideButton('Kiri', primaryColor),
                        _buildSideButton('Kanan', secondaryColor),
                      ],
                    ),
                  ],
                ),
              ),
              // Circular Progress bar and Timer
              SizedBox(
                width: 80,
                height: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: CircularProgressIndicator(
                        value: _remainingSeconds / _totalSeconds,
                        strokeWidth: 8,
                        backgroundColor: secondaryColor.withValues(
                          alpha: 0.1,
                        ),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _selectedSide == 'Kiri' ? primaryColor : (_selectedSide == 'Kanan' ? secondaryColor : Colors.grey),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: Colors.pinkAccent,
                          size: 20,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _formatTime(_remainingSeconds),
                          style: GoogleFonts.manrope(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1E293B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: secondaryColor.withValues(alpha: 0.08),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.notifications_active,
                  color: primaryColor,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Jadwal menyusui berikutnya: ',
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        color: textOnSurfaceVariant,
                      ),
                      children: [
                        TextSpan(
                          text: '${_nextFeedingTime.hour.toString().padLeft(2, '0')}:${_nextFeedingTime.minute.toString().padLeft(2, '0')} WIB',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1E293B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSideButton(String side, Color activeColor) {
    bool isSelected = _selectedSide == side;
    
    return InkWell(
      onTap: () => _selectSide(side),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected 
              ? activeColor 
              : activeColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? activeColor : Colors.transparent,
            width: 1,
          ),
        ),
        child: Text(
          'Sisi $side',
          style: GoogleFonts.manrope(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : activeColor,
          ),
        ),
      ),
    );
  }
}
