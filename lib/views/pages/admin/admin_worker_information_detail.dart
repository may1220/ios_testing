import 'package:ebhc/data_models/common_state_provider.dart';
import 'package:ebhc/data_models/daily/daily_repo.dart';
import 'package:ebhc/data_models/firebase_firestore_site_weather_stream_provider.dart';
import 'package:ebhc/data_models/health_state.dart';
import 'package:ebhc/data_models/health_state_provider.dart';
import 'package:ebhc/data_models/heart_rate_state_provider.dart';
import 'package:ebhc/data_models/map_state_provider.dart';
import 'package:ebhc/data_models/user_state_provider.dart';
import 'package:ebhc/views/pages/graph/chart_data.dart';
import 'package:ebhc/views/pages/graph/new_line_graph_page.dart';
import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:ebhc/views/pages/new_design/weather_icon.dart';
import 'package:ebhc/views/pages/user/detail_widget.dart';
import 'package:ebhc/views/widget/app_bar.dart';
import 'package:ebhc/views/widget/app_icon.dart';
import 'package:ebhc/views/widget/app_rich_text.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:ebhc/views/widget/heart_rate.dart';
import 'package:ebhc/views/widget/hot_warning.dart';
import 'package:ebhc/views/widget/near_me.dart';
import 'package:ebhc/views/widget/red_container.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ebhc/data_models/graph_model/graph_state.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart';

class AdminWorkerInformationPage extends HookConsumerWidget {
  const AdminWorkerInformationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final data = RouteData.of(context).queryParameters;
    final dateTimeProvider = ref.watch(dateTimeStateProvider);
    final mmsp = ref.watch(mapStateProvider.notifier);
    final mmState = ref.watch(mapStateProvider);
    final userState = ref.watch(userStateProvider).value;
    // final sideId = (userState != null) ? userState.siteId : "";
    // final weatherState = ref.watch(siteWeatherProvider(userState!.siteId));
    final currentHealth = ref.watch(currentHealthStreamProvider).value;
    final updatedTime = getHealthUpdateTime(currentHealth!.time);

    // const address = null;
    // const temperature = null;
    // const humidity = null;
    // const precipitation = null;
    // const condition = 31;
    Widget HightRateAndMap() {
      return Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            const RedContainerWidget(text: "非常に高い心拍数を記録しました。"),
            const RedContainerWidget(text: "非常に高い暑熱作業リスクを記録し..."),
            Container(
              height: 200,
              margin: const EdgeInsets.only(bottom: 10),
              child: Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition:
                        CameraPosition(target: mmState.lastPosition, zoom: 18),
                    onMapCreated: mmsp.onMapCreated,
                    myLocationEnabled: true,
                    compassEnabled: true,
                    markers: mmState.markers,
                    onCameraMove: mmsp.onCameraMove,
                  ),
                  Positioned(
                    top: 40,
                    right: 10,
                    child: FloatingActionButton(
                      onPressed: mmsp.addMarker,
                      tooltip: 'add marker',
                      backgroundColor: Colors.blue,
                      child:
                          const Icon(Icons.add_location, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const AppRichText(
              textOne: "緯度：",
              textTwo: "1939204694788036",
              sizeOne: 16,
              colorOne: Colors.white,
              colorTwo: Colors.white,
            ),
            const AppRichText(
              textOne: "経度：",
              textTwo: "7834968590765762",
              sizeOne: 16,
              colorOne: Colors.white,
              colorTwo: Colors.white,
            ),
          ],
        ),
      );
    }

    Widget remindValidation() {
      if (currentHealth.healthLevel == null) {
        return const SizedBox();
      }
      if (currentHealth.healthLevel == 1) {
        return HotWorkRiskContainer(context);
      } else if (currentHealth.healthLevel! > 2) {
        return HightRateAndMap();
      } else {
        return const SizedBox();
      }
    }

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBarWidget(
        title: "作業者情報",
        appBar: AppBar(),
        icon: false,
        isLeading: true,
        bgColor: AppColors.darkBackground,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
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
                  const SizedBox(
                    width: 10,
                  ),
                  AppText(
                    text: userState?.name ?? '',
                    size: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            remindValidation(),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: AppColors.btnBorderColor,
              thickness: 5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // RowWidget(healthLevel: currentHealth!.healthLevel),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HeartRate(),
                          AppRichText(
                            textOne: currentHealth.heartRate == null
                                ? '---'
                                : currentHealth.heartRate.toString(),
                            textTwo: "BPM     最新 ($updatedTime)",
                            colorOne: Colors.white,
                            colorTwo: AppColors.labelColor,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HotWarning(),
                          AppRichText(
                            textOne: currentHealth.heatstrokeLevel.toString(),
                            textTwo: "",
                            colorOne: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const AppText(
                    text: "心拍数",
                    size: 18,
                  ),
                  SizedBox(
                    height: 300,
                    child: dateTimeProvider.when(
                        data: (snapshot) {
                          List<HealthState> healthStateList = [];
                          List<HealthState> chartDataList = [];
                          for (var v in snapshot) {
                            if (v['heartRate'] != null) {
                              healthStateList.add(HealthState.fromJson(v));
                            }
                          }
                          if (healthStateList.isNotEmpty) {
                            int index = 0;
                            for (var i = 0; i < healthStateList.length; i++) {
                              String time = healthStateList[index].time;
                              String newTime = healthStateList[i].time;
                              if (i == 0) {
                                chartDataList.add(healthStateList[0]);
                              } else {
                                if (newTime != time) {
                                  chartDataList.add(healthStateList[i]);
                                  index = i;
                                }
                              }
                            }
                          } else {
                            String time =
                                DateFormat("yyyy-MM-dd").format(DateTime.now());
                            chartDataList.add(HealthState(time: time));
                          }
                          return NewLineGraphPage(dayList: chartDataList);
                        },
                        error: (err, stack) {
                          return Text("${err.toString()}");
                        },
                        loading: () => const Text("Loading")),
                  ),
                  // const AppText(
                  //   text: "熱暑作業リスク",
                  //   size: 18,
                  // ),
                  // AddressWidget(siteId: sideId),
                  const SizedBox(height: 10),
                  const DetailWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget HotWorkRiskContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: [
          Row(
            children: const [
              AppIcon(
                icon: Icons.notifications_outlined,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              AppText(
                text: "アラート通知",
                size: 15,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(color: AppColors.rowBgColor),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        AppIcon(
                          icon: Icons.circle,
                          color: AppColors.warningSunnyColor,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        HotWarning(),
                        SizedBox(
                          width: 10,
                        ),
                        // AppText(
                        //   text: "10:25",
                        //   size: 16,
                        // ),
                      ],
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: AppIcon(
                        icon: Icons.check_circle_outline,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: AppText(
                    text:
                        "暑熱作業リスクが0.9を記録しました。熱中症になる危険性があります。今の作業を一度中断して涼しいところで十分な水分を取り休憩させましょう。",
                    textAlign: TextAlign.left,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget RedContainer(String text) {
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
 


  //                 const NearMe(),
  //                 const SizedBox(height: 10),
  //                 weatherState.when(
  //                     data: (data) => ForecastTodayWidget(weatherState: data),
  //                     error: (err, stack) {
  //                       print(
  //                           "Error ForecastTodayWidget of Weather State => ${err.toString()}");
  //                       print(
  //                           "Error ForecastTodayWidget of Weather State => ${err.toString()}");
  //                       return const Text("error");
  //                     },
  //                     loading: () => const Text("Loading")),
  //                 DetailWidget(),
