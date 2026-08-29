import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Menginisialisasi animasi dan timer saat layar pertama kali dimuat
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _animationController.forward();

    // Pindah ke halaman utama setelah 3 detik
    _timer = Timer(const Duration(seconds: 3), _navigateToHome);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  // Fungsi untuk berpindah ke halaman utama (MainLayout)
  void _navigateToHome() {
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainLayout()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Warna tema khusus untuk tampilan splash screen
    const primaryColor = Color(0xFF064673);
    const textOnSurfaceVariant = Color(0xFF5A7182);

    return Scaffold(
      body: GestureDetector(
        onTap: _navigateToHome,
        child: Stack(
          children: [
            // Vibrant Background Gradient
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFF3F5), // soft pink hue
                    Color(0xFFF0F6FC), // soft blue hue
                  ],
                ),
              ),
            ),

            // Ambient Glow Top Left (Primary/20 blur)
            Positioned(
              top: -100,
              left: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor.withValues(alpha: 0.12),
                ),
              ),
            ),

            // Ambient Glow Bottom Right (Secondary/10 blur)
            Positioned(
              bottom: -100,
              right: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF30628A).withValues(alpha: 0.08),
                ),
              ),
            ),

            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // App Bar / Title Area
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        children: [
                          Text(
                            'MAMIKA',
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w800,
                                color: primaryColor,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              'Aplikasi Pedoman untuk ibu menyusui dengan ASI Eksklusif',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.manrope(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: textOnSurfaceVariant,
                                  height: 1.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Center Illustration Area
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Glassmorphism Outer Ring (Soft white shadow container)
                            Container(
                              width: 260,
                              height: 260,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withValues(alpha: 0.4),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.6),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryColor.withValues(alpha: 0.08),
                                    blurRadius: 30,
                                    offset: const Offset(0, 15),
                                  ),
                                ],
                              ),
                            ),

                            // Stylized Nurture Image Container
                            Container(
                              width: 200,
                              height: 200,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(16),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/baby_breastfeeding.png',
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.baby_changing_station,
                                      size: 80,
                                      color: primaryColor,
                                    );
                                  },
                                ),
                              ),
                            ),

                            // Floating Heart and Leaf Icons
                            const Positioned(
                              top: 20,
                              right: 25,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.pinkAccent,
                                size: 36,
                              ),
                            ),
                            const Positioned(
                              bottom: 30,
                              left: 15,
                              child: Icon(
                                Icons.spa,
                                color: Colors.greenAccent,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Footer / Tagline Area
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        children: [
                          const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Setia Bersama Ibu & Anak',
                            style: GoogleFonts.manrope(
                              textStyle: const TextStyle(
                                fontSize: 13,
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Copyright © 2026 Sofia Mawaddah. All rights reserved.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.manrope(
                              textStyle: TextStyle(
                                fontSize: 10,
                                color: textOnSurfaceVariant.withValues(
                                  alpha: 0.7,
                                ),
                                height: 1.4,
                              ),
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
      ),
    );
  }
}
