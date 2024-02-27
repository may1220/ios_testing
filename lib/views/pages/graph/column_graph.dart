import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnGraphPage extends StatefulWidget {
  final int index;
  const ColumnGraphPage({super.key, required this.index});

  @override
  State<ColumnGraphPage> createState() => _ColumnGraphPageState();
}

class _ColumnGraphPageState extends State<ColumnGraphPage> {
  List<_ChartData> chartList = [
    _ChartData(0, 0.3),
    _ChartData(1, 0.5),
    _ChartData(2, 0.6),
    _ChartData(3, 0.8, pointColor: AppColors.darkAccentGreen500),
    _ChartData(4, 0.9),
    _ChartData(5, 1),
    _ChartData(6, 1.3),
    _ChartData(7, 0.4),
    _ChartData(8, 0.5),
    _ChartData(9, 0.8),
    _ChartData(10, 0.9),
    _ChartData(13, 1.1),
    _ChartData(18, 1.3)
  ];

  List<_ChartData> weekList = [
    _ChartData("日", 0.2),
    _ChartData("月", 0.5),
    _ChartData("火", 0.6),
    _ChartData("水", 0.3),
    _ChartData("木", 0.9),
    _ChartData("金", 1),
    _ChartData("土", 1.2),
  ];
  @override
  void initState() {
    super.initState();
  }

  _getPrimaryXAxis() {
    switch (widget.index) {
      case 0:
        return NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(size: 0, width: 0),
          minorGridLines: const MinorGridLines(width: 0, color: Colors.black),
          interval: 6,
          borderWidth: 0,
          minimum: 0,

          maximum: 18,
          borderColor: Colors.black,
          isVisible: true,
          // crossesAt: 10,// for line
          labelStyle: const TextStyle(color: Colors.white),
        );
      case 1:
        return CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(size: 0, width: 0),
        );
    }
  }

  _getSeries() {
    switch (widget.index) {
      case 0:
        return _getDefaultColumnSeries();
      case 1:
        return _getLineDaysZoneSeries();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildTypesSplineChart();
  }

  /// Returns the spline types chart.
  SfCartesianChart _buildTypesSplineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: '(BPM)',
          alignment: ChartAlignment.near,
          textStyle: const TextStyle(color: Colors.white)),
      primaryXAxis: _getPrimaryXAxis(),
      primaryYAxis: NumericAxis(
        labelFormat: '{value}',
        minimum: 0,
        maximum: 1.5,
        interval: 0.5,
        axisLine: const AxisLine(width: 0),
        // placeLabelsNearAxisLine: false,
        // majorTickLines: const MajorTickLines(size: 0, width: 0),
        // borderColor: Colors.amber,
        borderWidth: 0,
        labelStyle: const TextStyle(color: Colors.white),
      ),
      series: _getSeries(),
    );
  }

  List<ColumnSeries<_ChartData, num>> _getDefaultColumnSeries() {
    return <ColumnSeries<_ChartData, num>>[
      ColumnSeries<_ChartData, num>(
        dataSource: chartList,
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y,
        pointColorMapper: (_ChartData sales, _) => sales.pointColor,
        dataLabelSettings: const DataLabelSettings(
            isVisible: true, textStyle: TextStyle(fontSize: 10)),
      )
    ];
  }

  List<ColumnSeries<_ChartData, String>> _getLineDaysZoneSeries() {
    return <ColumnSeries<_ChartData, String>>[
      ColumnSeries<_ChartData, String>(
          dataSource: weekList,
          xValueMapper: (_ChartData sales, _) => sales.x as String,
          yValueMapper: (_ChartData sales, _) => sales.y,
          pointColorMapper: (_ChartData data, _) => AppColors.bgBtnColor,
          color: AppColors.bgBtnColor
          // markerSettings: const MarkerSettings(isVisible: true)
          )
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y, {this.pointColor = AppColors.bgBtnColor});
  final dynamic x;
  final dynamic y;
  final Color pointColor;
}
