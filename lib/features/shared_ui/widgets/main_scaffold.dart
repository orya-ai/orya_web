import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orya_web/features/home_landing/presentation/pages/home_page.dart';
import 'package:orya_web/features/shared_ui/widgets/footer.dart';
import 'package:orya_web/features/shared_ui/widgets/nav_bar.dart';
import 'package:orya_web/core/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'package:orya_web/core/router/app_router.dart'; // For AppRoutes in drawer

class MainScaffold extends StatelessWidget {
  final int currentIndex;
  final VoidCallback onJoinPressed;
  final Widget child;

  const MainScaffold({
    super.key,
    required this.currentIndex,
    required this.onJoinPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 100, // Or use DrawerHeader for more standard styling
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: AppTheme.primaryBackgroundColor, // Example color
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Menu',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87, // Adjust for contrast
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'About',
                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                context.go(AppRoutes.about);
              },
            ),
            ListTile(
              title: Text(
                'Team',
                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                context.go(AppRoutes.team);
              },
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the drawer
                  onJoinPressed();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.9),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0, // Consistent with NavBar button
                ),
                child: Text(
                  'Join Waitlist',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Scrollable page content (behind the NavBar)
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Space for floating NavBar
                  Container(
                    height: 62, // This should match NavBar height
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, AppTheme.primaryBackgroundColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  child,
                  if (currentIndex == 0) const Footer(),
                ],
              ),
            ),
          ),

          // Floating, sticky NavBar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(onJoinPressed: onJoinPressed), // This will now be responsive
          ),
        ],
      ),
    );
  }
}