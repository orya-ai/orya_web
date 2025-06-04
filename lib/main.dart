import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/shared_ui/widgets/nav_bar.dart';
import 'features/static pages/presentation/pages/about_page.dart';
import 'features/static pages/presentation/pages/team_page.dart';
import 'features/shared_ui/widgets/footer.dart';
import 'core/theme/app_theme.dart';
import 'features/home_landing/presentation/widgets/hero_section.dart';

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
      body: Column(
        children: [
          // Fixed navigation bar
          NavBar(
            onAboutPressed: () => Navigator.pushNamed(context, '/about'),
            onTeamPressed: () => Navigator.pushNamed(context, '/team'),
            onJoinPressed: () => _scrollToSection(_heroSectionKey),
          ),
          // Main content area that pushes footer to bottom
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Hero section with waitlist form
                  _buildHeroSection(),
                  // About and Team sections removed, will be separate pages
                ],
              ),
            ),
          ),
          // Footer that stays at the bottom
          const Footer(),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return HeroSection(heroSectionKey: _heroSectionKey);
  }
}
