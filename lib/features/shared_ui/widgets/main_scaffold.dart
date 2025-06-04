import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orya_web/features/home_landing/presentation/pages/home_page.dart';
import 'package:orya_web/features/shared_ui/widgets/footer.dart';
import 'package:orya_web/features/shared_ui/widgets/nav_bar.dart';

class MainScaffold extends StatelessWidget {
  final int currentIndex;
  final VoidCallback onJoinPressed;
  final Widget child;
  
  const MainScaffold({
    super.key,
    required this.currentIndex,
    required this.onJoinPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navigation Bar
            NavBar(onJoinPressed: onJoinPressed),
            
            // Main Content
            child,
            
            // Footer (only on home page)
            if (currentIndex == 0) const Footer(),
          ],
        ),
      ),
    );
  }
}
