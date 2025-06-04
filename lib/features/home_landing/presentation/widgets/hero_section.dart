import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'iphone_mockup.dart';

class HeroSection extends StatelessWidget {
  final GlobalKey heroSectionKey;

  const HeroSection({
    super.key,
    required this.heroSectionKey,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 1000;

    return Container(
      key: heroSectionKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 24 : 80,
        vertical: isSmallScreen ? 60 : 100,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 1200,
            minHeight: MediaQuery.of(context).size.height - 200,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContent(textTheme, isSmallScreen),
              SizedBox(height: isSmallScreen ? 40 : 60),
              const IphoneMockup(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(TextTheme textTheme, bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 800),
          child: Text(
            'The Future of Digital Experience',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: isSmallScreen ? 36 : 60,
              fontWeight: FontWeight.bold,
              height: 1.1,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 24),
        FadeInDown(
          delay: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 800),
          child: Text(
            'Introducing a new way to interact with technology. Simple, intuitive, and powerful.',
            style: GoogleFonts.inter(
              fontSize: 24,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 40),
        FadeInUp(
          delay: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 800),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Learn more',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
