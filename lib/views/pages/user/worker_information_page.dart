import 'package:ebhc/data_models/graph_model/graph_state.dart';
import 'package:ebhc/data_models/health_state.dart';
import 'package:ebhc/data_models/health_state_provider.dart';
import 'package:ebhc/views/pages/graph/new_line_graph_page.dart';
import 'package:ebhc/views/pages/user/detail_widget.dart';
import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:ebhc/views/widget/app_bar.dart';
import 'package:ebhc/views/widget/app_rich_text.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:ebhc/views/widget/heart_rate.dart';
import 'package:ebhc/views/widget/hot_warning.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart';

class WorkerInformationPage extends HookConsumerWidget {
  final bool risk;
  const WorkerInformationPage({super.key, this.risk = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateTimeProvider = ref.watch(dateTimeStateProvider);
    final currentHealth = ref.watch(currentHealthStreamProvider);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 35, 38, 1),
      appBar: AppBarWidget(
          title: "作業者情報",
          appBar: AppBar(),
          icon: false,
          isLeading: true,
          bgColor: AppColors.darkBackground),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            color: Colors.pink,
            thickness: 5,
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  validationRish(),
                  const SizedBox(
                    height: 10,
                  ),
                  currentHealth.when(
                      data: (HealthState healthState) {
                        final time = DateFormat("HH:mm").format(DateTime.parse(
                            healthState.time == ""
                                ? DateTime.now().toString()
                                : healthState.time));
                        return !risk
                            ? AppRichText(
                                textOne: healthState.heartRate == null
                                    ? '---'
                                    : healthState.heartRate.toString(),
                                colorOne: Colors.white,
                                textTwo: "BPM     最新 ($time)",
                                colorTwo: AppColors.labelColor,
                              )
                            : AppText(
                                text: healthState.heatstrokeLevel.toString());
                      },
                      error: (o, s) => Container(),
                      loading: () => const AppText(
                            text: "東京都港区六本木",
                            size: 16,
                          )),
                  Expanded(
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
                  )
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 5,
          ),
          const Expanded(flex: 2, child: DetailWidget())
        ],
      ),
    );
  }

  Widget validationRish() {
    return !risk ? const HeartRate() : const HotWarning();
  }

  Widget textValidation(HealthState healthState) {
    return !risk
        ? AppRichText(
            textOne: healthState.heartRate.toString(),
            colorOne: Colors.white,
            textTwo: " BPM",
            colorTwo: AppColors.labelColor,
          )
        : AppText(text: healthState.heatstrokeLevel.toString());
  }
}
