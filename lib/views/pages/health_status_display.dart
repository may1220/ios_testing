// heatstroke_level
// 0: ほぼ安全
// 1: 注意
// 2: 危険
// 3: 危険継続 (アラート通知対象)

// health_level
// 0: 平常
// 1: 体調やや注意
// 2: 体調注意
// 3: 体調注意継続 (アラート通知対象)
// start後しばらくはnull

// https://qiita.com/kaizen_nagoya/items/cb7eb3199b0b98904a35
// 純色よりはJIS安全色など、ユニバーサルデザイン的な、見え方に配慮した色とする
// 0: #00B06B
// 1: #F2E700
// 2: #F6AA00
// 3: #FF4B00

import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HealthStatusWidget extends HookConsumerWidget {
  final String text;
  final Color? bgColor;
  const HealthStatusWidget(this.text, this.bgColor, {Key? key})
      : super(key: key);

  HealthStatusWidget.fromHeatStrokeLevel(level, {Key? key})
      : this("${getHeatStrokeLabel(level)} [$level]", getColor(level),
            key: key);

  HealthStatusWidget.fromHealthLevel(level, {Key? key})
      : this("${getHealthLabel(level)} [$level]", getColor(level), key: key);

  HealthStatusWidget.fromHeartRate(rate, {Key? key})
      : this("${getHeartRateLabel(rate)} [$rate]",
            getColor(toHeartRateLevel(rate)),
            key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(text, style: TextStyle(backgroundColor: bgColor));
  }
}

Color? getColor(dynamic level) {
  if (level == null) {
    return AppColors.labelColor;
  }
  switch (level) {
    case 0:
      return AppColors.darkAccentGreen500;
    case 1:
      return const Color(0xFFCC8900);
    case 2:
      return const Color(0xfff5610d);
    //    return const Color(0xffff4b00); // no adjustment
    case 3:
      // return const Color(0xffff4b00); // no adjustment
      return Colors.red;
    default:
      return AppColors.labelColor;
  }
}

String getHeatStrokeLabel(dynamic level) {
  if (level == "---") {
    return "---";
  }
  switch (level) {
    case 0:
      return "ほぼ安全";
    case 1:
      return "注意";
    case 2:
      return "危険";
    case 3:
      return "危険(継続中)";
    default:
      return "---"; // start後しばらくはnull?
    //return "LEVEL-$level";
  }
}

String getHealthLabel(dynamic level) {
  if (level == null) {
    return "---";
  }
  switch (level) {
    case 0:
      return "平常";
    case 1:
      return "体調やや注意";
    case 2:
      return "体調注意";
    case 3:
      return "体調注意(継続中)";
    default:
      return "---"; // start後しばらくはnull
  }
}

// TODO: to be local preference

const int minHeartRate = 10;
const int maxHeartRate = 100;

int toHeartRateLevel(int rate) {
  if (rate == null) {
    return -1;
  } else if (rate < minHeartRate || rate > maxHeartRate) {
    return 3;
  } else {
    return 0;
  }
}

String getHeartRateLabel(int rate) {
  int level = toHeartRateLevel(rate);
  switch (level) {
    case 0:
      return "平常";
    case 3:
      return "注意";
    default:
      return "---";
  }
}

Widget getIcon(dynamic level) {
  if (level == null) {
    return const SizedBox();
  }
  var iconColor = getColor(level);
  switch (level) {
    case 0:
      return Icon(
        Icons.check_circle_rounded,
        color: iconColor,
      );
    case 1:
      return Icon(
        Icons.warning_amber,
        color: iconColor,
      );
    case 2:
      return Icon(
        Icons.error,
        color: iconColor,
      );
    case 3:
      return Icon(
        Icons.error,
        color: iconColor,
      );
    default:
      return const SizedBox(); // start後しばらくはnull?
    //return "LEVEL-$level";
  }
}
