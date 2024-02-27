import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:flutter/material.dart';

class HotWarning extends StatelessWidget {
  const HotWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffffdd99),
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.flare, size: 16),
          ),
          const SizedBox(width: 4),
          const AppText(
            text: "暑熱作業リスク",
            color: AppColors.warningColor,
            size: 15,
          ),
          // const SizedBox(width: 7),
          //   const Icon(Icons.error, size: 13), // サイズ指定等が厳密ではないか？
        ],
      ),
    );
  }
}
