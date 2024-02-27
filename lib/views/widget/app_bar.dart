import 'package:ebhc/data_models/alert_manage_state_provider.dart';
import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class AppBarWidget extends HookConsumerWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String title;
  final bool icon;
  final Color bgColor;
  final bool isLeading;
  const AppBarWidget(
      {super.key,
      required this.appBar,
      this.title = "Smart",
      this.icon = true,
      this.bgColor = const Color(0xFF2F24E6),
      this.isLeading = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routemaster = Routemaster.of(context);
    final alertManageStateNotifier =
        ref.watch(alertManageStateNotifierProvider.notifier);
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          SizedBox(
            width: isLeading ? 10 : 0,
          ),
          isLeading
              ? GestureDetector(
                  onTap: () {
                    routemaster.pop();
                  },
                  child: const Icon(Icons.arrow_back))
              : const SizedBox(),
          const SizedBox(
            width: 10,
          ),
          title == "Smart"
              ? Image.asset(
                  "assets/images/Smart Construction_White.png",
                  height: 40,
                )
              : AppText(
                  text: title,
                  textAlign: TextAlign.left,
                ),
        ],
      ),
      backgroundColor: bgColor,
      actions: icon
          ? [
              GestureDetector(
                onTap: () {
                  alertManageStateNotifier.setGroupMode(isGroupMode: false);
                  routemaster.push('/alerts');
                },
                child: const CircleAvatar(
                  minRadius: 17,
                  backgroundColor: AppColors.bgBtnDisableColor,
                  child: Icon(
                    Icons.notifications,
                    color: AppColors.labelColor,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () async {
                  // final fcmsp = ref.watch(fcmStateProvider.notifier);
                  // await fcmsp.setToken("");
                  // await ref.read(firebaseAuthProvider).signOut();
                  // await routemaster
                  //     .popUntil((routeData) => routeData.path != "/");
                  Routemaster.of(context).push('settings');
                },
                child: const CircleAvatar(
                  minRadius: 17,
                  backgroundColor: AppColors.bgBtnDisableColor,
                  child: Icon(
                    Icons.person_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ]
          : [],
    );
  }

  /*  Container(
      height: Get.height / 14.55,
      color: Colors.amber,
      child: Row(
        children: [
          IconButton(
            onPressed: () { 
              _drawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.green,
            ),
          ),
          AppText(text: widget.title)
        ],
      ),
    ) */

  @override
  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
