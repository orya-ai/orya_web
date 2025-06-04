import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orya_web/features/home_landing/presentation/pages/home_page.dart';
import 'package:orya_web/features/shared_ui/widgets/main_scaffold.dart';
import 'package:orya_web/features/static pages/presentation/pages/about_page.dart';
import 'package:orya_web/features/static pages/presentation/pages/team_page.dart';

// Keys for navigation
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

// Route paths
class AppRoutes {
  static const String home = '/';
  static const String about = '/about';
  static const String team = '/team';
  
  // Helper to get the current route index
  static int getCurrentIndex(String path) {
    if (path.startsWith(about)) return 1;
    if (path.startsWith(team)) return 2;
    return 0; // Default to home
  }
}

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.home,
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        final currentIndex = AppRoutes.getCurrentIndex(state.uri.path);
        
        return MainScaffold(
          currentIndex: currentIndex,
          onJoinPressed: () => _showWaitlistDialog(context),
          child: child,
        );
      },
      routes: [
        // Home
        GoRoute(
          path: AppRoutes.home,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomePage(),
          ),
        ),
        
        // About
        GoRoute(
          path: AppRoutes.about,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AboutPage(),
          ),
        ),
        
        // Team
        GoRoute(
          path: AppRoutes.team,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: TeamPage(),
          ),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Page not found: ${state.uri.path}'),
    ),
  ),
);

void _showWaitlistDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Join Waitlist'),
      content: const Text('Coming soon!'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
