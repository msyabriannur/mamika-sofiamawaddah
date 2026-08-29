import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_drawer.dart';
import 'dashboard_screen.dart';
import 'catatan_screen.dart';
import 'panduan_screen.dart';
import 'tanya_ahli_screen.dart';
import '../globals.dart';

class MainLayout extends StatefulWidget {
  final int initialTab;
  const MainLayout({super.key, this.initialTab = 0});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int _currentIndex;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = [
    const DashboardScreen(),
    const CatatanScreen(),
    const PanduanScreen(),
    const TanyaAhliScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialTab;
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF064673);
    const textOnSurfaceVariant = Color(0xFF5A7182);

    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white.withValues(alpha: 0.8),
        elevation: 0,
        scrolledUnderElevation: 1,
        // Make the app bar semi-transparent/blurred using glassmorphism in style
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: primaryColor, size: 28),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(
          'MAMIKA',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ValueListenableBuilder<bool>(
              valueListenable: hasNotification,
              builder: (context, hasNotif, child) {
                return IconButton(
                  icon: Icon(
                    hasNotif ? Icons.notifications_active : Icons.notifications_outlined,
                    color: hasNotif ? Colors.redAccent : primaryColor,
                    size: 26,
                  ),
                  onPressed: () {
                    // Reset notification when tapped
                    hasNotification.value = false;
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white.withValues(alpha: 0.95),
          selectedItemColor: primaryColor,
          unselectedItemColor: textOnSurfaceVariant,
          selectedLabelStyle: GoogleFonts.manrope(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: GoogleFonts.manrope(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home, color: primaryColor),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit_note_outlined),
              activeIcon: Icon(Icons.edit_note, color: primaryColor),
              label: 'Catatan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined),
              activeIcon: Icon(Icons.menu_book, color: primaryColor),
              label: 'Panduan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.support_agent_outlined),
              activeIcon: Icon(Icons.support_agent, color: primaryColor),
              label: 'Tanya Ahli',
            ),
          ],
        ),
      ),
    );
  }
}
