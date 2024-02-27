import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:ebhc/views/widget/app_icon.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:flutter/material.dart';

class HeartRate extends StatelessWidget {
  const HeartRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffee9999),
      ),
      padding: const EdgeInsets.all(5),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(
            icon: Icons.favorite,
            color: AppColors.rowBgColor,
          ),
          SizedBox(width: 8),
          AppText(
            text: "心拍数",
            color: Color(0xff2b0000),
            size: 15,
          )
        ],
      ),
    );
  }
}
