import 'package:ebhc/data_models/common_state_provider.dart';
import 'package:ebhc/data_models/daily/daily_repo.dart';
import 'package:ebhc/data_models/graph_model/graph_state.dart';
import 'package:ebhc/data_models/health_state_provider.dart';
import 'package:ebhc/data_models/heart_rate_state.dart';
import 'package:ebhc/data_models/heart_rate_state_provider.dart';
import 'package:ebhc/data_models/user_state_provider.dart';
import 'package:ebhc/views/pages/health_status_display.dart';
import 'package:ebhc/views/widget/app_icon.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:ebhc/views/widget/heart_rate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart';

// 一旦ここで書き出し

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

// figmaでのコメントとcss指定値で異なるのはなぜ？
// Light側も微妙な感じにずれている

  // cardの装飾色
  // Dark/Neutral/800 36383E : [css] background: #37393F;
  static const darkNeutral800 = Color(0xFF36383E);
  // Dark/Neutral/600 6A6E7A : [css] border: 1px solid #6B6F7B;
  static const darkNeutral600 = Color(0xFF6A6E7A);
  // Light/Neutral/50 F4F4F5 : [css]　background: #F4F5F5;
  // Dark/Neutral/900 212226 : [css] background: #212326;
  static const darkBackground = Color(0xFF212326);
  static const labelColor = Color(0xffF7F7F8);
  static const textColor = Color(0xFFA8A3F5);
  static const darkNeutral900 = Color(0xff212226);
  static const bgBtnDisableColor = Color(0xFFA0A3AC);
  static const bgBtnColor = Color(0xFF2F24E6);
  static const btnBorderColor = Color(0xFF837DF2);
  static const rowBgColor = Color(0xFF37393F);
  static const rowSelectBgColor = Color(0xFF51545D);
  static const sunnyColor = Color(0xFFFFAB00);
  static const warningSunnyColor = Colors.red;
  static const hotColor = Color(0xFFFFDD99);
  static const containerColor = Color(0xFF6B6F7B);
  // darkのfont color
  // Light/Neutral/50  : [css] color: #F4F5F5;
  static const darklightNeutral50 = Color(0xfff4f4f5);
  static const warningColor = Color(0xFF332200);
  static const warningBorderColor = Color(0xFFFFBC33);

// dark
// Dark/Accent/green/500
//color: #28D435;
  static const darkAccentGreen500 = Color(0xFF28D435);
// Dark/Accent/yellow/500 */
// color: #FFAB00
  static const darkAccentYellow500 = Color(0xFFFFAB00);

// light
// Light/Accent/green/700 の#167E1E
  static const lightAccentGreen700 = Color(0xFF167E1E);

// Light/Accent/yellow/600
// color: #CC8900;
  static const lightAccentYellow600 = Color(0xFFCC8900);

  static const lightNeutral50 = Color(0xFFF4F4F5);
  // Light/Neutral/200 D6D7DB : [css] border: 1px solid #D6D7DB;
  static const lightNeutra200 = Color(0xFFD6D7DB);

  // lightのfontcolor
  // Light/Neutral/900 ?????? : [css] color: #131416;
  static const lightNeutral900 = Color(0xFF131416);

  // Light/Base/white FFFFFF : [css] background: #FFFFFF
  static const lightBaseWhite = Color(0xFFFFFFFF);
  static const yellow500 = Color(0xFFFFBC33);
  static const red300 = Color(0xFFED7878);
  static const yellow300 = Color(0xFFFFCD66);
  static const recordColor = Color(0xFF4B0202);
  static const pinkColor = Color(0xFFED7878);

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

// 良好はcheck
// 注意はwarning-fill
// 注意noticeのheadはwarning_amberか？
// 気温高い異常はerror
// 心拍数はheartだがfavoriteになる？
// 遮熱作業リスクはflare
//  リスク高いときは後ろにerror
// 体調注意はicon/risk で monitor_heart か？
//  これも後ろにerrorをつける
//
// 次に進むのはarrow_forward_ios
//
// user設定はcircleにpersonを入れたもの
//
// 天気はsunny等があれば。

// 単位はフォント小さくする。数値は逆に大きくしてbold

String getHealthUpdateTime(String time) {
  if (time != "") {
    // 0123456789012345678
    // 2022-10-10 11:22:33
    switch (time[10]) {
      case " ":
        return time.substring(11, 16);
      case "Z":
      default:
        break;
    }
  }
  return "---:---";
}

class HealthPanelWidget extends HookConsumerWidget {
  final dynamic healthLevel;
  final dynamic heatStrokeLevel;
  final String healthUpdateTime;
  final bool isLeader;

  const HealthPanelWidget(
      {required this.healthLevel,
      this.heatStrokeLevel,
      required this.healthUpdateTime,
      required this.isLeader,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heartRateProvider = ref.watch(newHeartRateStateProvider);
    final heartRateState = ref.watch(heartRateStateProvider);
    // final iconColor = getColor(healthLevel);
    final textColor = getColor(healthLevel);
    final textMessage = getHealthLabel(healthLevel);
    final iconData = getIcon(healthLevel);
    final time = DateFormat("HH:mm").format(DateTime.parse(
        healthUpdateTime == "" ? DateTime.now().toString() : healthUpdateTime));

    return Container(
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText(
            text: "今のあなたの健康状態",
            size: 17,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.containerColor, // const Color(0xff6a6e7a),
                width: 1,
              ),
              color: AppColors.rowBgColor, // Color(0xff36383e),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 2, bottom: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: AppColors
                            .containerColor, // const Color(0xff6a6e7a),
                        width: 1,
                      ),
                      color: const Color(0xffffdd99), // Color(0xff36383e),
                    ),
                    child: const AppText(
                      text: "体調レベル",
                      size: 15,
                      color: Colors.black,
                    )),
                Row(
                  children: [
                    iconData,
                    const SizedBox(width: 8),
                    AppText(
                      text: textMessage,
                      color: textColor!,
                      size: 30,
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // isLeader == true
                //     ? const SizedBox()
                //     : healthLevel == 1
                //         ? const HeatStrokeLevelNotificationPanel()
                //         : const SizedBox(),
                // healthLevel == 1
                //     ? const SizedBox(
                //         height: 10,
                //       )
                //     : const SizedBox(),
                // const HealthLevelNotificationPanel(),
                HeartRatePanel(
                    //heartRate: 0,
                    heartRate: heartRateState.heartRate ?? "---",
                    maxHeartRate: heartRateProvider.maxHeartRate,
                    minHeartRate: heartRateProvider.minHeartRate,
                    time: time),
                const SizedBox(height: 8),
                HeatStrokeLevelPanel(heatStrokeLevel: heatStrokeLevel),
                Align(
                  alignment: Alignment.centerRight,
                  child: AppText(
                    text: "最新 ($time)",
                    size: 13,
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ひとまずdark対応は保留

class HealthLevelPanel extends StatelessWidget {
  final int healthLevel;

  const HealthLevelPanel(this.healthLevel, {super.key});

  @override
  Widget build(BuildContext context) {
    // まとめて設定したいところ
    final iconColor = getColor(healthLevel);
    // (healthLevel == 0)
    //     ? AppColors.lightAccentGreen700
    //     : AppColors.lightAccentYellow600;
    final textColor = getColor(healthLevel);
    // (healthLevel == 0)
    //     ? AppColors.lightAccentGreen700
    //     : AppColors.lightAccentYellow600;
    final textMessage = getHealthLabel(healthLevel);
    // (healthLevel == 0) ? "良好" : "注意";

    return Container(
      width: 328,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFD6D7DB), // dark: Color(0xff6a6e7a),
          width: 1,
        ),
        color: const Color(0xFFF4F5F5), // dark : Color(0xff36383e),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 24x24でcirclar=8でcheck
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  const AppIcon(),
                  const SizedBox(width: 8),
                  Text(
                    textMessage,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 30,
                      fontFamily: "Noto Sans JP",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// /* Light/Neutral/50

// F4F4F5
// */
// background: #F4F5F5;
// /* Light/Neutral/200

// D6D7DB
// */
// border: 1px solid #D6D7DB;

// text color
// /* Light/Neutral/900 */
// color: #131416;

// divider
//* Light/Neutral/200
//
//D6D7DB
//*/
// background: #D6D7DB;

// right arrow
// /* Light/Neutral/900

// 121315
// */
// background: #131416;

class HeatStrokeLevelPanel extends StatelessWidget {
  final dynamic heatStrokeLevel;

  const HeatStrokeLevelPanel({super.key, this.heatStrokeLevel});

  @override
  Widget build(BuildContext context) {
    final heatStrokeTextColor = getColor(heatStrokeLevel);
    final textMessage = getHeatStrokeLabel(heatStrokeLevel);

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.containerColor, // dark: Color(0xff6a6e7a),
          width: 1,
        ),
        color: AppColors.rowBgColor, // dark : Color(0xff36383e),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xffffdd99),
            ),
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.flare, size: 16),
                ),
                const SizedBox(width: 4),
                const Text(
                  "暑熱作業リスク",
                  style: TextStyle(
                    color: Color(0xff332200),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 7),
                const Icon(Icons.error_outline, size: 13), // サイズ指定等が厳密ではないか？
              ],
            ),
          ),
          const SizedBox(height: 10),
          AppText(
            text: textMessage,
            weight: FontWeight.w600,
            textAlign: TextAlign.left,
            size: 19,
            color: heatStrokeTextColor!,
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}

class HeartRatePanel extends HookConsumerWidget {
  final dynamic heartRate;
  final int maxHeartRate;
  final int minHeartRate;
  final String time;
  const HeartRatePanel(
      {super.key,
      required this.maxHeartRate,
      required this.minHeartRate,
      required this.heartRate,
      required this.time});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userStateProvider).value;
    return GestureDetector(
      onTap: () {
        if (userState!.isLeader) {
          Routemaster.of(context)
              .push("admin_detail", queryParameters: {"time": time});
        } else {
          Routemaster.of(context)
              .push("worker_detail", queryParameters: {"time": time});
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.containerColor, // const Color(0xff6a6e7a),
            width: 1,
          ),
          color: AppColors.rowBgColor, // Color(0xff36383e),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeartRate(),
                const SizedBox(height: 8),
                IntrinsicHeight(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BpmWidget(
                        heartRate,
                        fontSize: 22.0,
                      ),
                      const SizedBox(width: 10),
                      const VerticalDivider(
                        width: 1,
                        // height: 30,
                        color: Color(0xFFD6D7DB), // Color(0xff50535c),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText(
                            text: "最大心拍",
                            size: 14,
                          ),

                          const SizedBox(height: 4),
                          // width: ??
                          BpmWidget(maxHeartRate),
                        ],
                      ),
                      const SizedBox(width: 15),
                      const VerticalDivider(
                        width: 1,
                        // height: 30,
                        color: Color(0xFFD6D7DB), // Color(0xff50535c),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText(
                            text: "最小心拍",
                            size: 14,
                          ),
                          const SizedBox(height: 4),
                          // width 56
                          BpmWidget(minHeartRate),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: 16,
              height: 16,
              // color: const Color(0xffd9d9d9),
              padding: const EdgeInsets.only(
                left: 5,
                right: 6,
              ),
              child: const Visibility(
                visible: true,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Icon(Icons.arrow_forward_ios,
                    size: 16,
                    color: // ひとまずdisableでgreyにしておく
                        AppColors.labelColor),
              ), //Color(0xff131416)), // Color(0xffd9d9d9)),
            ),
          ],
        ),
      ),
    );
  }
}

class BpmWidget extends StatelessWidget {
  final dynamic bpm;
  final double fontSize;

  const BpmWidget(
    this.bpm, {
    Key? key,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 8,
          fontFamily: "Noto Sans JP",
          color: Colors.white, // Color(0xfff7f7f7),
        ),
        children: <TextSpan>[
          TextSpan(
            text: bpm.toString(),
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(text: ' BPM', style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}

///////////
// TODO: カードの内側にpadding等が必要
class HealthLevelNotificationPanel extends HookConsumerWidget {
  const HealthLevelNotificationPanel({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 328,
      //
      child: Card(
        // TODO: boxShadowをshadowColor&elevationでごまかしでokか？
        //   boxShadow: const [
        //     BoxShadow(
        //       color: Color(0x26131416),
        //       blurRadius: 20,
        //       offset: Offset(0, 10),
        //     ),
        //     BoxShadow(
        //       color: Color(0x19131416),
        //       blurRadius: 6,
        //       offset: Offset(0, 3),
        //     ),
        //   ],
        elevation: 4,
        shadowColor: const Color(0x19131416), //
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(
            color: Color(0xffd50000),
          ),
        ),
        color: const Color(0xfffdecec),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO: このあたり構造を最適化できそうではある
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Icon(Icons.error,
                              color: Color(0xffd50000), size: 20),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "気温が非常に高いです",
                          style: TextStyle(
                            color: Color(0xff2b0000),
                            fontSize: 16,
                            fontFamily: "Noto Sans JP",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 本文領域
          ],
        ),
      ),
    );
  }
}

class HeatStrokeLevelNotificationPanel extends HookConsumerWidget {
  const HeatStrokeLevelNotificationPanel({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.warningBorderColor,
        ),
        color: AppColors.warningColor,
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Icon(Icons.warning_amber,
                            color: Color(0xffffab00), size: 20),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "暑熱作業リスクが高いです",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "Noto Sans JP",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 32,
              right: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "暑熱作業リスクが90%を超えました。今すぐ水分を補給して涼しい場所で休憩しましょう。",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
