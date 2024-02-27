import 'package:ebhc/data_models/graph_model/graph_data_extension.dart';
import 'package:ebhc/data_models/health_state.dart';
import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class NewLineGraphPage extends HookConsumerWidget {
  List<HealthState> dayList;
  NewLineGraphPage({super.key, required this.dayList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime dateTime = DateTime.now();
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      annotations: const <CartesianChartAnnotation>[
        CartesianChartAnnotation(
            widget: Text(''),
            coordinateUnit: CoordinateUnit.point,
            x: 0, // x position of annotation
            y: 75 // y position of annotation
            ),
      ],
      title: ChartTitle(
          text: '(BPM)',
          alignment: ChartAlignment.near,
          textStyle: const TextStyle(color: Colors.white)),
      primaryXAxis: DateTimeAxis(
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: const MajorTickLines(size: 0, width: 0),
        minorGridLines: const MinorGridLines(width: 0, color: Colors.black),
        borderWidth: 0,
        dateFormat: DateFormat("d/H"),
        interval: 6,
        intervalType: DateTimeIntervalType.hours,
        minimum: DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0),
        maximum:
            DateTime(dateTime.year, dateTime.month, dateTime.day, 24, 00, 00),
        borderColor: Colors.black,
        isVisible: true,
        labelStyle: const TextStyle(color: Colors.white),
        axisLabelFormatter: (AxisLabelRenderDetails args) {
          var label = args.text;
          if (label.startsWith('${dateTime.day}/')) {
            label = args.text
                .substring(args.text.indexOf('/') + 1, args.text.length);
          } else {
            label = '24';
          }
          TextStyle textStyle =
              args.textStyle.copyWith(fontWeight: FontWeight.normal);
          return ChartAxisLabel(label, textStyle);
        },
      ),
      primaryYAxis: NumericAxis(
        labelFormat: '',
        minimum: 0,
        maximum: 200,
        interval: 25,
        borderWidth: 0,
        labelStyle: const TextStyle(color: Colors.white),
      ),
      series: <LineSeries<HealthState, DateTime>>[
        LineSeries<HealthState, DateTime>(
            name: "BPM",
            dataSource: dayList.interval(const Duration(minutes: 5)),
            xValueMapper: (HealthState hs, index) {
              String changedFormat = DateFormat("yyyy-MM-dd HH:mm:ss")
                  .format(DateTime.parse(hs.time));
              return DateTime.parse(changedFormat);
            },
            yValueMapper: (HealthState sales, _) => sales.heartRate,
            markerSettings: dayList.length == 1
                ? MarkerSettings(
                    isVisible: dayList.first.heatstrokeLevel == 0 &&
                            dayList.first.heartRate == 0
                        ? false
                        : true,
                    color: AppColors.textColor,
                    width: 3,
                    height: 3)
                : const MarkerSettings(isVisible: false),
            color: AppColors.textColor,
            width: 3)
      ],
    );
  }
}
