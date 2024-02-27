import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextAlign textAlign;
  const AppText({
    super.key,
    required this.text,
    this.size = 22,
    this.color = AppColors.lightBaseWhite,
    this.weight = FontWeight.normal,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        fontFamily: 'Noto Sans JP',
      ),
    );
  }
}
