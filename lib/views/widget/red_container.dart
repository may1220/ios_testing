import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:ebhc/views/widget/app_icon.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:flutter/material.dart';

class RedContainerWidget extends StatelessWidget {
  final String text;
  const RedContainerWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: AppColors.recordColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.pinkColor)),
      child: Row(
        children: [
          const AppIcon(
            icon: Icons.error_outline,
            color: AppColors.pinkColor,
            size: 26,
          ),
          const SizedBox(
            width: 10,
          ),
          AppText(
            text: text,
            size: 16,
          ),
        ],
      ),
    );
  }
}
