import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

import 'components/nav_bar.dart';
import 'components/waitlist_form.dart';
import 'about_page.dart';
import 'team_page.dart';
import 'components/footer.dart';
import 'app_logo.dart';
import 'core/theme/app_theme.dart'; // Import the theme from core/theme

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    
    return MaterialApp(
      title: 'ORYA Waitlist',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Use the theme from app_theme.dart
      home: const HomePage(),
      routes: {
        '/about': (context) => const AboutPage(),
        '/team': (context) => const TeamPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroSectionKey = GlobalKey();
  // _aboutSectionKey and _teamSectionKey removed

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) { // This can be simplified or adapted if only hero section scroll remains
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Hero section with waitlist form
                _buildHeroSection(),
                
                // About and Team sections removed, will be separate pages
                
                // Footer with social links
                const Footer(),
              ],
            ),
          ),
          
          // Fixed navigation bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              onAboutPressed: () => Navigator.pushNamed(context, '/about'),
              onTeamPressed: () => Navigator.pushNamed(context, '/team'),
              onJoinPressed: () => _scrollToSection(_heroSectionKey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      key: _heroSectionKey,
      width: double.infinity,
      // Adjusted padding for a more focused hero section
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildHeroContent(), // Headline text
          const SizedBox(height: 40), // Space between text and form
          WaitlistForm(), // Centered WaitlistForm
          // Removed LayoutBuilder for a simpler, consistent column layout
          // Desktop/Mobile differences can be handled within WaitlistForm or _buildHeroContent if needed
        ],
      ),
    );
  }

  Widget _buildHeroContent() {
    // Centering the text content
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Center text for a more focused look
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 800),
          child: Text(
            'The Future of Digital Experience is Coming.', // More concise headline
            textAlign: TextAlign.center, // Ensure text is centered
            style: GoogleFonts.inter(
              fontSize: 48, // Kept original size, can be adjusted
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 20),
        FadeInDown(
          delay: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 800),
          child: Text(
            'Sign up to be the first to know when ORYA launches.', // Direct call to action
            textAlign: TextAlign.center, // Ensure text is centered
            style: GoogleFonts.inter(
              fontSize: 18,
              color: Colors.black87,
              height: 1.6,
            ),
          ),
        ),
        // "Learn More" button removed to give prominence to WaitlistForm
      ],
    );
  }
}
