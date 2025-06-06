import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import 'package:orya_web/core/router/app_router.dart';
import 'iphone_mockup.dart';
import 'package:orya_web/core/theme/app_theme.dart';

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
        _buildFirstSection(context, textTheme, isSmallScreen),
        _buildWhitespaceDivider(),
        _buildSecondSection(context, textTheme, isSmallScreen),
      ],
    );
  }

  Widget _buildFirstSection(BuildContext context, TextTheme textTheme, bool isSmallScreen) {
    return Container(
      color: AppTheme.primaryBackgroundColor,
      width: double.infinity,
      padding: EdgeInsets.only(
        left: isSmallScreen ? 24 : 80,
        right: isSmallScreen ? 24 : 80,
        // No bottom padding here to allow IphoneMockup to align to the container's bottom
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1200,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 60), // Space between text content and image
              _buildHeroTextContent(context, textTheme, isSmallScreen),
              const SizedBox(height: 60), // Space between text content and image
              const IphoneMockup(),       // IphoneMockup is the last element
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroTextContent(BuildContext context, TextTheme textTheme, bool isSmallScreen) {
    return Column(
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
    );
  }

  Widget _buildWhitespaceDivider() {
    // Full-bleed whitespace section
    return Container(
      width: double.infinity,
      height: 15,
      color: Colors.white, // Or any color you prefer
    );
  }

  Widget _buildSecondSection(BuildContext context, TextTheme textTheme, bool isSmallScreen) {
    // Placeholder for the next section's content
    return Container(
      color: AppTheme.primaryBackgroundColor,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 24 : 80,
        vertical: 80, 
      ),
      // color: Theme.of(context).scaffoldBackgroundColor, // Optional background color
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: const Text(
            'Second Section Content Goes Here',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
