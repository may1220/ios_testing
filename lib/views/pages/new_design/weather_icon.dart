// Light/Accent/yellow/500  FFAB00

import 'package:flutter/material.dart';

const lightAccentYellow500 = Color(0xFFFFAB00);

class WeatherIcon extends StatelessWidget {
  int condition;
  final double size;

  static const int unknown = 0;
  static const double sizeLarge = 32;
  static const double sizeMedium = 24;
  static const double sizeSmall = 16;

  WeatherIcon({
    this.condition = unknown,
    this.size = sizeSmall,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (condition >= 0) {
      return Image.asset(
        "assets/icon/icon$condition.png",
        scale: 2,
      );
      // return ImageIcon(
      //   AssetImage('assets/icon/$condition.png'),
      //   color: Colors.white,
      //   size: 70,
      // );
    } else {
      return Image.asset(
        "assets/icon/31.png",
        scale: 2,
      );
    }
  }
}
