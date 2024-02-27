import 'package:ebhc/data_models/heart_rate_state_provider.dart';
import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:ebhc/views/widget/app_rich_text.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class DetailWidget extends HookConsumerWidget {
  const DetailWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heartRateState = ref.watch(newHeartRateStateProvider);
    print("Max time ${heartRateState.maxTime}");
    List<Map<String, dynamic>> detailList = [
      {
        "name": "最大心拍数",
        "bpm": heartRateState.maxHeartRate,
        "time": heartRateState.maxTime == ""
            ? heartRateState.maxTime
            : DateFormat("HH:mm").format(DateTime.parse(heartRateState.maxTime))
      },
      {
        "name": "最小心拍数",
        "bpm": heartRateState.minHeartRate,
        "time": heartRateState.minTime == ""
            ? heartRateState.minTime
            : DateFormat("HH:mm").format(DateTime.parse(heartRateState.minTime))
      }
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: AppText(
            text: "詳細データ",
            size: 20.0,
          ),
        ),
        Column(
          children: List.generate(
              detailList.length,
              (index) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.rowBgColor),
                    margin:
                        const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: detailList[index]["name"],
                          size: 18.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppRichText(
                              textOne: detailList[index]["bpm"].toString(),
                              colorOne: Colors.white,
                              colorTwo: AppColors.labelColor,
                              textTwo: "BPM",
                              sizeOne: 20,
                            ),
                            AppText(
                              text: detailList[index]["time"],
                              size: 18,
                              color: AppColors.labelColor,
                            )
                          ],
                        )
                      ],
                    ),
                  )),
        )
      ],
    );
  }
}
