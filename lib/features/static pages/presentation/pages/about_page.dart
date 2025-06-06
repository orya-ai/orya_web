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
                ? 'Orya\’s mission is to solve the modern epidemic of loneliness and emotional disconnection by helping people build and sustain their village - their inner community of aligned, supportive, deeply felt human connections. Through beautifully designed, habit-forming experiences and emotionally intelligent AI, Orya enables users to deepen the relationships they already have and discover new ones that align with who they are and who they are becoming. Whether someone feels unseen in a crowded city or isolated in silence, we give them the tools to form, grow, and tend to their most important relationships with care and ease.'
                : 'We believe mental health doesn\’t begin at crisis. It begins with the quiet strength of consistent, meaningful connection. Orya transforms the invisible labor of staying close - remembering, reaching out, showing up - into something light, intentional, and even joyful. Our mission is not just to help people talk. It\’s to help them feel seen, remembered, and truly known - because the right relationship at the right time can change, or even save, a life.',
            style: GoogleFonts.inter(
              fontSize: 16,
              height: 1.8,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            delay == 0
                ? 'We envision a world where mental health is not treated only in crisis, but protected proactively - through strong human connection, accessible emotional support, and daily psychological hygiene. In this future, loneliness is not normalized or dismissed as a phase of adulthood. It is seen for what it is: a social and biological health threat, with cognitive, emotional, and physical consequences. We believe that just as clean water and basic healthcare became global standards, emotional infrastructure - the systems that help people form and maintain meaningful relationships - must become essential to human wellbeing.'
                : 'Our long-term vision is to help shift the mental health paradigm from reactive to preventative - making emotional wellbeing part of everyday life, like brushing your teeth or tracking your steps. Orya is our first major step toward that future: a system that helps individuals build and tend to their emotional support networks with care, intelligence, and intention. But the broader goal is systemic - to reduce the global burden of isolation, rehumanize digital interaction, and make emotional fitness a norm, not a luxury. We believe that solving mental health at scale starts with rebuilding the architecture of connection.',
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
