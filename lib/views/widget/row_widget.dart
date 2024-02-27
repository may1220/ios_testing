import 'package:ebhc/data_models/common_state_provider.dart';
import 'package:ebhc/views/pages/health_status_display.dart';
import 'package:ebhc/views/widget/app_icon.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class RowWidget extends HookConsumerWidget {
  final int healthLevel;
  const RowWidget({super.key, required this.healthLevel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconColor = getColor(healthLevel);
    final textColor = getColor(healthLevel);
    final textMessage = getHealthLabel(healthLevel);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppIcon(
            color: iconColor!,
          ),
          const SizedBox(
            width: 10,
          ),
          AppText(
            text: textMessage,
            color: textColor!,
            textAlign: TextAlign.left,
          ),
          // const SizedBox(
          //   width: 10,
          // ),
          // AppText(
          //   text: "最新 ($time)",
          //   size: 15,
          //   textAlign: TextAlign.left,
          // )
        ],
      ),
    );
  }
}
