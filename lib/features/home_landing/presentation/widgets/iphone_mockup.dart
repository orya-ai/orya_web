import 'package:flutter/material.dart';

class IphoneMockup extends StatelessWidget {
  const IphoneMockup({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.4, // Use 40% of screen height
      child: Image.asset(
        'assets/images/screen_mockup_demi.png',
        fit: BoxFit.contain,
        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
          return Center(
            child: Text(
              'Error loading image:\n${error.toString()}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, backgroundColor: Colors.black54),
            ),
          );
        },
      ),
    );
  }
}
