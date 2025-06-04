import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'nav_bar.dart';
import 'package:orya_web/features/waitlist/presentation/widgets/waitlist_form.dart';
import 'package:orya_web/features/static pages/presentation/pages/about_page.dart';
import 'package:orya_web/features/static pages/presentation/pages/team_page.dart';
import 'package:orya_web/core/theme/app_logo.dart';
import 'package:orya_web/core/theme/app_theme.dart';

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
        'icon': FontAwesomeIcons.xTwitter,
        'url': 'https://twitter.com/',
      },
      {
        'icon': FontAwesomeIcons.instagram,
        'url': 'https://instagram.com/orya.ai',
      },
      {
        'icon': FontAwesomeIcons.linkedin,
        'url': 'https://linkedin.com/company/orya-io',
      },
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor, // Use same color as app bar
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppLogo(color: Colors.black87, size: 32),
              
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildFooterLink('About'),
                  _buildFooterLink('Team'),
                  _buildFooterLink('Privacy'),
                  _buildFooterLink('Terms'),
                  _buildFooterLink('Contact'),
                ],
              ),
              
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  socialLinks.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: IconButton(
                      icon: FaIcon(
                        socialLinks[index]['icon'] as IconData,
                        size: 16,
                      ),
                      onPressed: () => _launchUrl(socialLinks[index]['url'] as String),
                      color: Colors.black87,
                      hoverColor: Colors.black.withOpacity(0.1),
                      splashRadius: 20,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '© ${DateTime.now().year} ORYA. All rights reserved.',
            style: GoogleFonts.inter(
              color: Colors.black54,
              fontSize: 12,
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
