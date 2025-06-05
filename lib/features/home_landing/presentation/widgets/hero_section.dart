import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import 'package:orya_web/core/router/app_router.dart';
import 'iphone_mockup.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 1000;

    return Column(
      children: [
        // Main Content Section
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 24 : 80,
            vertical: isSmallScreen ? 60 : 100,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1200,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildContent(textTheme, isSmallScreen),
                  const SizedBox(height: 60),
                  const IphoneMockup(),
                ],
              ),
            ),
          ),
        ),
        
        // Full-bleed whitespace section
        Container(
          width: double.infinity,
          height: 15,
          color: Colors.white, // Or any color you prefer
        ),
        
        /*
        // Next content section (placeholder)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: const Center(
            child: SizedBox(
              width: 1200,
              // Add your next section content here
              child: Text(
                'Next Section',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),

        */
      ],
    );
  }

  Widget _buildContent(TextTheme textTheme, bool isSmallScreen) {
    return Builder(
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'The Future of Communication',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: isSmallScreen ? 36 : 60,
                fontWeight: FontWeight.bold,
                height: 1.1,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ),
          const SizedBox(height: 16),
          FadeInDown(
            delay: const Duration(milliseconds: 200),
            duration: const Duration(milliseconds: 800),
            child: Text(
              'Built for the modern life.',
              style: GoogleFonts.roboto(
                fontSize: isSmallScreen ? 18 : 24,
                color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.9),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          FadeInUp(
            delay: const Duration(milliseconds: 400),
            duration: const Duration(milliseconds: 800),
            child: TextButton(
              onPressed: () {
                context.go(AppRoutes.about);
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                backgroundColor: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.9),
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
      ),
    );
  }
}
