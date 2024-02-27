import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.primary, // ボタン背景など/appbar塗りつぶしの色
    required this.primaryVariant,
    required this.onPrimary, // ex)ボタン文字
    required this.secondary,
    required this.secondaryVariant,
    required this.onSecondary,
    required this.background, // 全体の背景
    required this.onBackground,
    required this.surface, // cardなどitemの背景
    required this.onSurface,
    required this.error,
    required this.onError,
  });

  factory AppColors.light() {
    return const AppColors(
      primary: Color(0xFF2F24E6), // ok
      primaryVariant: Color(0xFF3700B3), // これはどうする？
      onPrimary: Color(0xFFFFFFFF), // とりあえず純色whiteにしておく
      //
      secondary: Color(0xFF03DAC6), // secondaryはどうする？
      secondaryVariant: Color(0xFF018786),
      onSecondary: Color(0xFF000000),
      //
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFF000000),
      //
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF000000),
      // エラー系は？
      error: Color(0xFFB00020),
      onError: Color(0xFFFFFFFF),
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      primary: Color(0xFF3B31ED), // ok
      primaryVariant: Color(0xFF3700B3),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFF03DAC6),
      secondaryVariant: Color(0xFF018786),
      onSecondary: Color(0xFF000000),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFF000000),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF000000),
      error: Color(0xFFB00020),
      onError: Color(0xFFFFFFFF),
    );
  }

  /// Material Colors https://material.io/design/color/the-color-system.html#color-theme-creation
  final Color primary;
  final Color primaryVariant;
  final Color onPrimary;
  final Color secondary;
  final Color secondaryVariant;
  final Color onSecondary;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color error;
  final Color onError;
}
