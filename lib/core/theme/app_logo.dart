import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG support

class AppLogo extends StatelessWidget {
  final double size;
  final Color color;
  
  const AppLogo({
    super.key, 
    this.size = 40, 
    this.color = Colors.black
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/logo/logo.svg',
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      semanticsLabel: 'Orya Logo', // For accessibility
    );
  }
}
