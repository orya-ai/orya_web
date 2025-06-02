import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_logo.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final socialLinks = [
      {
        'icon': FontAwesomeIcons.twitter,
        'url': 'https://twitter.com/',
      },
      {
        'icon': FontAwesomeIcons.instagram,
        'url': 'https://instagram.com/',
      },
      {
        'icon': FontAwesomeIcons.linkedin,
        'url': 'https://linkedin.com/',
      },
    ];

    return Container(
      width: double.infinity,
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Column(
        children: [
          const AppLogo(color: Colors.black87),
          const SizedBox(height: 32),
          Wrap(
            spacing: 24,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _buildFooterLink('About'),
              _buildFooterLink('Team'),
              _buildFooterLink('Privacy'),
              _buildFooterLink('Terms'),
              _buildFooterLink('Contact'),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              socialLinks.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: IconButton(
                  icon: FaIcon(
                    socialLinks[index]['icon'] as IconData,
                    size: 20,
                  ),
                  onPressed: () => _launchUrl(socialLinks[index]['url'] as String),
                  color: Colors.black87,
                  hoverColor: Colors.black12,
                  splashRadius: 24,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            '© ${DateTime.now().year} ORYA. All rights reserved.',
            style: GoogleFonts.inter(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
