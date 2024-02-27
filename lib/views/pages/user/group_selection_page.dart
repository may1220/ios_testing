import 'package:ebhc/views/easy_dashboard_home_page.dart';
import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:ebhc/views/widget/app_bar.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class GroupSelectionPage extends StatefulWidget {
  const GroupSelectionPage({super.key});

  @override
  State<GroupSelectionPage> createState() => _GroupSelectionPageState();
}

class _GroupSelectionPageState extends State<GroupSelectionPage> {
  int selectedIndex = 0;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBarWidget(appBar: AppBar(), isLeading: false),
      body: SafeArea(
          // minimum: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const AppText(
                    text: "作業グループ選択",
                    weight: FontWeight.w600,
                    textAlign: TextAlign.start,
                  ),
                  const AppText(
                    text: "管理される作業グループを選択しましょう。",
                    textAlign: TextAlign.start,
                    size: 15,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: AppColors.labelColor,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: AppColors.labelColor,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: AppColors.labelColor,
                                ),
                              ),
                              hintText: "名前を検索",
                              hintStyle: TextStyle(
                                  color: AppColors.darklightNeutral50
                                      .withOpacity(0.4),
                                  fontFamily: "Noto Sans JP"),
                              contentPadding:
                                  const EdgeInsets.only(left: 10, right: 1),
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.darklightNeutral50
                                    .withOpacity(0.4),
                                size: 20,
                              ),
                            ),
                            style: const TextStyle(
                              color: AppColors.labelColor,
                              fontFamily: "Noto Sans JP",
                            ),
                            onChanged: (String value) {},
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 45,
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/filter.png",
                            // scale: 0.1,
                            cacheHeight: 18,
                            cacheWidth: 22,
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => GroupItem(index),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 2.5,
            color: Colors.black,
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin:
                const EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 5),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const EasyDashboardHomePage();
                }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected
                    ? AppColors.bgBtnColor
                    : AppColors.bgBtnDisableColor,
                side: BorderSide(
                    width: 1, // the thickness
                    color: isSelected
                        ? AppColors.btnBorderColor
                        : AppColors.darkBackground // the color of the border
                    ),
              ),
              child: AppText(
                text: isSelected ? "西島直輝グループを選択" : "作業グループを選択してください",
                size: 15.0,
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget GroupItem(index) {
    return GestureDetector(
      onTap: () {
        selectedIndex = index;
        isSelected = !isSelected;
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: index == 10 - 1 ? 10 : 0),
        padding: const EdgeInsets.only(top: 7, bottom: 7, left: 15, right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: selectedIndex == index
              ? AppColors.rowSelectBgColor
              : AppColors.rowBgColor,
          border: Border.all(
              color: selectedIndex == index
                  ? AppColors.btnBorderColor
                  : AppColors.darkBackground),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 65,
              width: 65,
              child: Image.asset("assets/images/profile.png"),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  text: "西島直輝グループ",
                  size: 18,
                ),
                Row(
                  children: const [
                    AppText(
                      text: "管理者：",
                      size: 18,
                    ),
                    AppText(
                      text: "西島直輝",
                      size: 18,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
