import 'package:flutter/material.dart';
import 'package:orya_web/features/home_landing/presentation/widgets/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          HeroSection(),
        ],
      ),
    );
  }
}
