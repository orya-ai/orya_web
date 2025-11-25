import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

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
                'Terms & Conditions',
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Last Updated: 25/11/2025',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 24),

            _paragraph(
              'These Terms & Conditions (“Terms”) govern your use of the ORYA mobile application (“the App”), which is owned and operated by ORYA LIMITED (“we”, “us”, “our”). By accessing or using the App, you agree to be bound by these Terms.',
            ),

            _title('1. Use of the App'),

            _paragraph(
              'You agree to use the App for lawful purposes only and in accordance with these Terms. You must not:',
            ),

            _bullet('Interfere with or disrupt the App or its services'),
            _bullet('Attempt to reverse-engineer, modify, or copy the App'),
            _bullet('Use the App in a way that is harmful, abusive, or unlawful'),
            _bullet('Misuse the App or its content beyond its intended purpose'),

            _title('2. Intellectual Property'),

            _paragraph(
              'All content in the App, including text, prompts, cards, designs, graphics, logos, and branding, is the intellectual property of ORYA LIMITED and is protected by copyright and other applicable laws.',
            ),

            _paragraph(
              'You may not copy, reproduce, distribute, or create derivative works from the App or its content without prior written permission from ORYA LIMITED.',
            ),

            _title('3. In-App Purchases'),

            _paragraph(
              'The App may offer optional paid features, upgrades, or subscriptions. All purchases are processed through the Apple App Store or Google Play Store and are subject to their terms and conditions. ORYA LIMITED does not handle payments directly.',
            ),

            _title('4. User Conduct and Termination'),

            _paragraph(
              'You agree not to use the App in any way that is unlawful, harmful, abusive, or inconsistent with its intended use.',
            ),

            _paragraph(
              'ORYA LIMITED reserves the right to suspend or terminate access to the App, at its discretion, if we believe you have violated these Terms, misused the App, or engaged in behaviour that may negatively impact the App, its users, or our rights.',
            ),

            _paragraph(
              'You may stop using the App at any time.',
            ),

            _title('5. Disclaimer'),

            _paragraph(
              'The App is provided on an “as is” and “as available” basis. To the fullest extent permitted by law, we make no warranties or guarantees regarding the performance, availability, or results of using the App.',
            ),

            _paragraph(
              'Use of the App is at your own risk.',
            ),

            _title('6. Limitation of Liability'),

            _paragraph(
              'To the maximum extent permitted by law, ORYA LIMITED, including its directors, employees, and affiliates, shall not be liable for:',
            ),

            _bullet('Any losses arising from your use of, or inability to use, the App'),
            _bullet('Loss of data, profits, or business opportunities'),
            _bullet('Indirect, incidental, or consequential damages'),

            _paragraph(
              'Your sole remedy is to discontinue use of the App.',
            ),

            _title('7. Governing Law'),

            _paragraph(
              'These Terms are governed by the laws of the United Kingdom, except where local consumer protection laws require otherwise.',
            ),

            _title('8. Contact Information'),

            _paragraph(
              'If you have any questions regarding these Terms & Conditions, please contact:',
            ),

            const SizedBox(height: 8),

            _paragraph('ORYA LIMITED', bold: true),
            _paragraph('Email: team@orya.io', bold: true),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 8),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _paragraph(String text, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 16,
          height: 1.6,
          fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•  ',
            style: GoogleFonts.inter(fontSize: 16),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}