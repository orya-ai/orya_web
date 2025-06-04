import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInUp(
              duration: const Duration(milliseconds: 600),
              child: Text(
                'About ORYA',
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 900) {
                  // Desktop layout
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildContentColumn(0)),
                      const SizedBox(width: 60),
                      Expanded(child: _buildContentColumn(200)),
                    ],
                  );
                } else {
                  // Mobile layout
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildContentColumn(0),
                      const SizedBox(height: 40),
                      _buildContentColumn(200),
                    ],
                  );
                }
              },
            ),
            const SizedBox(height: 80), // Space for bottom navigation bar
          ],
        ),
      ),
    );
  }

  Widget _buildContentColumn(int delay) {
    return FadeInUp(
      delay: Duration(milliseconds: 200 + delay),
      duration: const Duration(milliseconds: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            delay == 0 ? 'Our Mission' : 'Our Vision',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            delay == 0
                ? 'We\'re building a platform that redefines the way people connect with products they love. Our mission is to create a seamless, intuitive experience that brings value to users while maintaining the highest standards of design and functionality.'
                : 'Looking ahead, we envision a world where technology enhances human connection rather than replacing it. Our product aims to be at the forefront of this movement, setting new standards for how digital experiences can enrich our lives in meaningful ways.',
            style: GoogleFonts.inter(
              fontSize: 16,
              height: 1.8,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            delay == 0
                ? 'Founded in 2024, we\'ve been working tirelessly to bring our vision to life. What started as a simple idea has grown into a passionate team of creators, developers, and designers united by a common purpose.'
                : 'Our approach combines cutting-edge technology with thoughtful design, ensuring that every interaction feels natural and enhances your everyday experience. We believe that the best products don\'t just solve problems—they create new possibilities.',
            style: GoogleFonts.inter(
              fontSize: 16,
              height: 1.8,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
