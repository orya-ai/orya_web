import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orya_web/core/router/app_router.dart';
import 'package:orya_web/core/theme/app_logo.dart';

class NavBar extends StatelessWidget {
  final VoidCallback? onJoinPressed;

  const NavBar({
    super.key,
    this.onJoinPressed,
  });

    @override
  Widget build(BuildContext context) {
    // Helper to build the common container styling for the NavBar
    Widget navBarContainer(Widget child) => ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
            child: Container(
              height: 62,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.08),
                    offset: const Offset(0, 4),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: child,
            ),
          ),
        );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0), // Added small vertical padding
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Define a breakpoint. Let's use 768px as a common threshold for mobile/desktop nav.
            bool isMobile = constraints.maxWidth < 768;

            if (isMobile) {
              // Mobile Layout: Logo on left, Hamburger on right
              return navBarContainer(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo
                    GestureDetector(
                      onTap: () => context.go(AppRoutes.home),
                      child: AppLogo(
                        size: 40,
                        color: Colors.black, // Ensure visibility
                      ),
                    ),
                    // Hamburger Menu Icon
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black), // Ensure visibility
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                  ],
                ),
              );
            } else {
              // Desktop Layout: Logo, Centered NavItems, Button on right
              return navBarContainer(
                Row(
                  children: [
                    // Logo
                    GestureDetector(
                      onTap: () => context.go(AppRoutes.home),
                      child: AppLogo(
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                    // Centered Navigation Links
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _NavItem(
                            title: 'About',
                            onPressed: () => context.go(AppRoutes.about),
                          ),
                          const SizedBox(width: 32), // Adjusted spacing
                          _NavItem(
                            title: 'Team',
                            onPressed: () => context.go(AppRoutes.team),
                          ),
                        ],
                      ),
                    ),
                    // Join Waitlist Button on the far right
                    ElevatedButton(
                      onPressed: onJoinPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.9),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
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
          },
        ),
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
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          foregroundColor: _isHovered ? Colors.black : Colors.black87,
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        child: Text(widget.title),
      ),
    );
  }
}