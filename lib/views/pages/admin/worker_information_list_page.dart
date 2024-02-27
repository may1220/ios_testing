import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebhc/data_models/group/group_list_stream_provider.dart';
import 'package:ebhc/data_models/health_state.dart';
import 'package:ebhc/data_models/user_state.dart';
import 'package:ebhc/views/pages/admin/admin_worker_information_detail.dart';
import 'package:ebhc/views/pages/health_status_display.dart';
import 'package:ebhc/views/widget/app_icon.dart';
import 'package:ebhc/views/widget/app_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:ebhc/views/widget/app_bar.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class WorkerInformationListPage extends HookConsumerWidget {
  const WorkerInformationListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupListProvider = ref.watch(groupListStreamProvider);
    final gMLP = ref.watch(groupMembersProvider);
    List<Map<String, dynamic>> newgroupList = [];
    List<Map<String, dynamic>> searchGroupList = [];
    TextEditingController searchController = TextEditingController();

    searchFunction(groupList) {
      if (searchController.text.isEmpty) {
        searchGroupList = [];

        for (var value in groupList) {
          value["members"].entries.forEach((element) {
            newgroupList.add({"id": element.key, "name": element.value});
            searchGroupList.add({"id": element.key, "name": element.value});
          });
        }
      } else {
        final newGroup = searchGroupList.where((e) {
          return e["name"].contains(searchController.text);
        }).toList();
        if (newGroup.isNotEmpty) {
          newgroupList = newGroup;
        } else {
          newgroupList = searchGroupList;
        }
      }

      return newgroupList;
    }

    Widget searchWidget() {
      return Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 45,
              child: TextFormField(
                controller: searchController,
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
                      color: AppColors.darklightNeutral50.withOpacity(0.4),
                      fontFamily: "Noto Sans JP"),
                  contentPadding: const EdgeInsets.only(left: 10, right: 1),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.darklightNeutral50.withOpacity(0.4),
                    size: 20,
                  ),
                ),
                style: const TextStyle(
                  color: AppColors.labelColor,
                  fontFamily: "Noto Sans JP",
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              searchFunction("");
            },
            child: SizedBox(
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
            ),
          )
        ],
      );
    }

    return Scaffold(
        backgroundColor: AppColors.darkBackground,
        appBar: AppBarWidget(
          appBar: AppBar(),
          isLeading: false,
        ),
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const AppText(
                text: "作業者情報",
                weight: FontWeight.w600,
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                    color: const Color(0xFF332200),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1.0, color: AppColors.yellow500)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.warning_amber,
                      color: AppColors.yellow500,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    AppText(
                      text: "未読の通知が7件あります",
                      textAlign: TextAlign.start,
                      size: 16,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              searchWidget(),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                  child: groupListProvider.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) =>
                    Center(child: Text(error.toString())),
                data: (groupList) {
                  newgroupList = [];
                  newgroupList = searchFunction(groupList);

                  return ListView.builder(
                      itemCount: newgroupList.length,
                      itemBuilder: (context, index) =>
                          StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection("users")
                                  .doc("${newgroupList[index]["id"]}")
                                  .snapshots(),
                              builder: (_, snapshot) {
                                if (snapshot.data == null) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.black),
                                  );
                                } else {
                                  final userList = snapshot.data!.data()
                                      as Map<String, dynamic>;
                                  print("Current Healt Data $userList");
                                  print(
                                      "Current Healt Data ${userList["currentHealth"]}");
                                  final user = UserState.fromJson(userList);
                                  final healthState = HealthState.fromJson(
                                      userList["currentHealth"]);

                                  if (snapshot.hasError) {
                                    return Text(snapshot.error.toString());
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                          color: Colors.black),
                                    );
                                  }

                                  return WorkerInformationItem(
                                    user: user,
                                    healthState: healthState,
                                  );
                                }
                              }));
                },
              ))
            ],
          ),
        ));
    /*    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBarWidget(
        appBar: AppBar(),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) =>
                      const WorkerInformationItem()),
            ),
          ],
        ),
      ),
    );
   */
  }
}

class SearchWidget extends StatefulWidget {
  final List<Map<String, dynamic>> searchGroupList;
  const SearchWidget({super.key, required this.searchGroupList});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                    color: AppColors.darklightNeutral50.withOpacity(0.4),
                    fontFamily: "Noto Sans JP"),
                contentPadding: const EdgeInsets.only(left: 10, right: 1),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.darklightNeutral50.withOpacity(0.4),
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
    );
  }
}

class WorkerInformationItem extends HookConsumerWidget {
  final UserState user;
  final HealthState healthState;
  const WorkerInformationItem(
      {super.key, required this.user, required this.healthState});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final healthStatus = getHealthLabel(healthState.healthLevel);
    final healthColor = getColor(healthState.healthLevel);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: AppColors.rowBgColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1.0, color: AppColors.darkNeutral600)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            SizedBox(
              height: 75,
              width: 85,
              child: Stack(
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    padding: const EdgeInsets.only(right: 3),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomLeft,
                        image: AssetImage("assets/images/profile.png"),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 2,
                    left: 55,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: const Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: AppColors.lightBaseWhite,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: user.name,
                    textAlign: TextAlign.start,
                    size: 16,
                    weight: FontWeight.normal,
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  AppRichText(
                    textOne: "健康状態  ：",
                    textTwo: healthStatus,
                    colorTwo: healthColor!,
                    colorOne: AppColors.darkAccentGreen500,
                    weightOne: FontWeight.normal,
                    sizeOne: 16.0,
                  ),
                  // AppText(
                  //   text: "健康状態：${healthStatus}",
                  //   textAlign: TextAlign.start,
                  //   size: 16,
                  //   weight: FontWeight.normal,
                  //   color: healthColor,
                  // ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText(
                              text: "心拍数",
                              textAlign: TextAlign.start,
                              size: 16,
                              weight: FontWeight.normal,
                              color: AppColors.red300,
                            ),
                            // SizedBox(
                            //   height: 5,
                            // ),
                            AppRichText(
                              textOne: healthState.heartRate.toString(),
                              textTwo: " BPM",
                              sizeOne: 20,
                              sizeTwo: 14,
                              colorOne: Colors.white,
                              colorTwo: Colors.grey,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const VerticalDivider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText(
                              text: "暑熱作業リスク",
                              textAlign: TextAlign.start,
                              size: 16,
                              weight: FontWeight.normal,
                              color: AppColors.yellow300,
                            ),
                            AppRichText(
                              textOne: healthState.heatstrokeLevel.toString(),
                              sizeOne: 20,
                              sizeTwo: 14,
                              textTwo: "回",
                              colorOne: Colors.white,
                              colorTwo: Colors.grey,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const AdminWorkerInformationPage();
                }));
              },
              child: const AppIcon(
                icon: Icons.arrow_forward_ios,
                color: Colors.white,
                size: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
