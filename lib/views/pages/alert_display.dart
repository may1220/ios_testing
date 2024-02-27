import 'package:flutter/material.dart';

class AlertDisplay {
  static Color getAlertColor(level) {
    switch (level) {
      case 14:
      case 24:
      case 34:
        return Colors.red;
      case 13:
      case 23:
      case 32:
        return Colors.yellow;
      default:
        return Colors.black;
    }
  }

  static String getAlertName(alertType) {
    switch (alertType) {
      case 13:
        return "熱中症危険";
      case 14:
        return "熱中症危険(長時間継続)";
      case 23:
        return "体調注意";
      case 24:
        return "体調注意(長時間継続)";
      case 32:
        return "心拍数異常";
      case 34:
        return "心拍数異常(上昇)";
      default:
        return "TYPE-$alertType";
    }
  }
}
