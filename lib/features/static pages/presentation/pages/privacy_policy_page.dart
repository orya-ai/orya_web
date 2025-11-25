import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

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
                'Privacy Policy',
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
              'This Privacy Policy explains how ORYA LIMITED (“we”, “us”, “our”) collects, uses, and protects information when you use the ORYA mobile application (“the App”). We are committed to protecting your privacy and complying with all applicable data protection laws, including the UK GDPR and EU GDPR.',
            ),

            _title('1. Information We Collect'),

            _paragraph(
              'We collect only the minimum information necessary to operate and improve the App.',
            ),

            _subtitle('1.1 Information You Provide'),

            _paragraph(
              'If you contact us by email or through support, we may collect your email address and any information you choose to include in your message.',
            ),

            _subtitle('1.2 Automatically Collected Data'),

            const SizedBox(height: 12),

            _bullet('Device type and operating system'),
            _bullet('App usage and performance data'),
            _bullet('Crash logs and error reports'),

            const SizedBox(height: 12),

            _paragraph(
              'This data is used only to improve stability, functionality, and user experience.',
            ),

            _title('2. How We Use Your Information'),

            _bullet('Operate and maintain the App'),
            _bullet('Improve performance and features'),
            _bullet('Diagnose and fix technical issues'),
            _bullet('Respond to support requests'),

            const SizedBox(height: 12),

            _paragraph(
              'We do not sell your data and do not use your data for advertising purposes.',
            ),

            _title('3. Legal Basis for Processing (GDPR)'),

            _bullet(
              'Legitimate interests (ensuring the App functions effectively)',
            ),

            _title('4. Sharing of Information'),

            _paragraph(
              'We may share limited data with trusted third-party service providers, such as analytics or hosting platforms, who help us operate the App.',
            ),

            _paragraph(
              'All such providers are required to handle data securely and in compliance with data protection laws. We do not share your personal data for marketing or resale purposes.',
            ),

            _title('5. Data Retention'),

            _paragraph(
              'We retain personal data only for as long as necessary to fulfil the purposes described in this Policy or to meet legal requirements. When you request deletion, we will remove your personal data from our active systems.',
            ),

            _title('6. Your Rights'),

            _bullet('Access your data'),
            _bullet('Correct inaccurate data'),
            _bullet('Request deletion'),
            _bullet('Restrict or object to processing'),
            _bullet('Withdraw consent when processing is based on consent'),
            _bullet('Request data portability'),

            const SizedBox(height: 12),

            _paragraph(
              'To exercise any of these rights, please contact us at team@orya.io.',
            ),

            _title('7. Data Deletion Requests'),

            _paragraph(
              'You may request deletion of your data at any time by contacting:',
            ),

            const SizedBox(height: 8),

            _paragraph(
              'team@orya.io',
              bold: true,
            ),

            _paragraph(
              'We will respond to your request within 30 days, unless a longer period is legally required.',
            ),

            _title('8. Children’s Privacy'),

            _paragraph(
              'The App is not intended for children under the age of 18. We do not knowingly collect personal data from children.',
            ),

            _title('9. International Data Transfers'),

            _paragraph(
              'Some of our service providers may be located outside the United Kingdom. Where applicable, we ensure that appropriate safeguards, such as Standard Contractual Clauses, are in place.',
            ),

            _title('10. Changes to This Policy'),

            _paragraph(
              'We may update this Privacy Policy from time to time. The most recent version will always be available within the App or on our website.',
            ),

            _title('11. Contact Information'),

            _paragraph(
              'If you have any questions about this Privacy Policy, please contact:',
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

  Widget _subtitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
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