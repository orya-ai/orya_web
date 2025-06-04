import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orya_web/core/theme/app_logo.dart';

// import 'features/shared_ui/widgets/nav_bar.dart'; // Erroneous self-import commented out
import 'package:orya_web/features/waitlist/presentation/widgets/waitlist_form.dart';
import 'package:orya_web/features/static pages/presentation/pages/about_page.dart';
import 'package:orya_web/features/static pages/presentation/pages/team_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    this.onAboutPressed,
    this.onTeamPressed,
    required this.onJoinPressed,
  });

  final VoidCallback? onAboutPressed;
  final VoidCallback? onTeamPressed;
  final VoidCallback onJoinPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor, // Use app bar background color from theme
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: const Offset(0, 2),
            blurRadius: 8, // Slightly tighter blur for a cleaner edge
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          const AppLogo(),
          const Spacer(),
          if (MediaQuery.of(context).size.width > 600) ...[
            _NavItem(title: 'About', onPressed: onAboutPressed ?? () => Navigator.pushNamed(context, '/about')),
            const SizedBox(width: 32),
            _NavItem(title: 'Team', onPressed: onTeamPressed ?? () => Navigator.pushNamed(context, '/team')),
            const SizedBox(width: 32),
          ],
          ElevatedButton(
            onPressed: onJoinPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
              splashFactory: InkRipple.splashFactory, // Keep splash factory
            ).copyWith(
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.white.withOpacity(0.1);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.white.withOpacity(0.2);
                  }
                  return null; // Defer to default splash color or behavior
                },
              ),
            ),
            child: Text(
              'Join Waitlist',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  const _NavItem({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onPressed,
        hoverColor: Colors.transparent, // Disable default InkWell hover color
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          widget.title,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: _isHovered ? Colors.black : Colors.black87, // Darken on hover
          ),
        ),
      ),
    );
  }
}

