import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkControlButtonWidget extends HookConsumerWidget {
  final bool isStartWorkingButton;
  final bool isStopWorkingButton;

  final void Function()? onPressed;

  static const startingDialogTitle = "業務を開始します";
  static const startingDialogMessage = "業務を開始してもよろしいでしょうか？\n"
      "一度業務ボタンを押すと、しばらくの間業務ボタンを押せなくなります。";
  static const endingDialogTitle = "業務を終了します";
  static const endingDialogMessage = "お疲れ様でした。\n"
      "業務を終了する場合は業務終了ボタンを押してください。";

  const WorkControlButtonWidget(
      {required this.isStartWorkingButton,
      required this.isStopWorkingButton,
      required this.onPressed,
      super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 0&0 or 1&1なら無効 (start/stop排他)
    final isDisabledButton = (isStartWorkingButton == isStopWorkingButton);
    final title = (isStopWorkingButton) ? "業務中" : "業務開始";
    final label = (isStopWorkingButton) ? "業務終了" : "業務開始";
    final dialogTitle =
        (isStopWorkingButton) ? endingDialogTitle : startingDialogTitle;
    final dialogMessage =
        (isStopWorkingButton) ? endingDialogMessage : startingDialogMessage;
    return Container(
      width: MediaQuery.of(context).size.width, //360,
      color: AppColors.rowBgColor, // Color(0xff36383e),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  size: 18,
                  textAlign: TextAlign.center,
                ),
                const AppText(
                  text: "業務開始の旨は管理者に通知されません",
                  size: 14,
                  color: Color(0xFFB5B8BF),
                  textAlign: TextAlign.start,
                )
              ],
            ),
          ),
          const SizedBox(width: 5),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: (isStopWorkingButton)
                    ? const Color(0xffE60A0A)
                    : const Color(0xff3b30ed),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: (isDisabledButton)
                  ? null
                  : () async {
                      print("Dialog Title $dialogTitle");
                      print("Dialog Title $dialogMessage");
                      final resultOk = await showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            content: SizedBox(
                              height: 180,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AppText(
                                    text: dialogTitle,
                                    size: 19,
                                    weight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  AppText(
                                    text: dialogMessage,
                                    size: 17,
                                    textAlign: TextAlign.left,
                                  )
                                ],
                              ),
                            ),
                            backgroundColor: AppColors.rowBgColor,
                            actions: <Widget>[
                              // ボタン領域
                              TextButton(
                                child: AppText(
                                  text:
                                      (isStartWorkingButton) ? "閉じる" : "業務を続ける",
                                  size: 16,
                                  color: Color(0xFFD3D5D9),
                                ),
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                              ),
                              TextButton(
                                child: AppText(
                                  text:
                                      (isStartWorkingButton) ? "業務開始" : "業務終了",
                                  // text:
                                  //     (isStartWorkingButton) ? "勤務開始" : "業務終了",
                                  color: (isStartWorkingButton)
                                      ? AppColors.textColor
                                      : AppColors.pinkColor,
                                ),
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                              ),
                            ],
                          );
                        },
                      );
                      if (resultOk) {
                        if (onPressed != null) {
                          onPressed!();
                        }
                      }
                    },
              child: AppText(
                text: label,
                size: 15,
              )),
          // Container(
          //   height: 32,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(4),
          //     border: Border.all(
          //       color: const Color(0xff736ced),
          //       width: 1,
          //     ),
          //     color: const Color(0xff3b30ed),
          //   ),
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 12,
          //     vertical: 4,
          //   ),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       SizedBox(
          //         height: 24,
          //         child: Row(
          //           mainAxisSize: MainAxisSize.min,
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: const [
          //             Text(
          //               "業務開始",
          //               textAlign: TextAlign.center,
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 14,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
