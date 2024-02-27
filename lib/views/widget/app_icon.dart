import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  const AppIcon(
      {super.key,
      this.color = const Color(0xFF167E1E),
      this.icon = Icons.check_circle_rounded,
      this.size = 24.0});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: color, size: size);
  }
}
