import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineGraphPage extends StatefulWidget {
  final int index;
  const LineGraphPage({super.key, required this.index});

  @override
  State<LineGraphPage> createState() => _LineGraphPageState();
}

class _LineGraphPageState extends State<LineGraphPage> {
  List<_ChartData> chartList = [
    _ChartData(0, 73),
    _ChartData(1, 35),
    _ChartData(2, 45),
    _ChartData(3, 77),
    _ChartData(4, 100),
    _ChartData(5, 20),
    _ChartData(6, 90),
    _ChartData(7, 60),
    _ChartData(8, 73),
    _ChartData(9, 9),
    _ChartData(10, 73),
    _ChartData(13, 35),
    _ChartData(14, 125),
    _ChartData(15, 150),
    _ChartData(16, 73),
    _ChartData(18, 35)
  ];
  List<_ChartData> weekList = [
    _ChartData("日", 73),
    _ChartData("月", 35),
    _ChartData("火", 45),
    _ChartData("水", 77),
    _ChartData("木", 100),
    _ChartData("金", 20),
    _ChartData("土", 90),
    // _ChartData(7, 60),
    // _ChartData(8, 73),
    // _ChartData(9, 9),
    // _ChartData(10, 73),
    // _ChartData(13, 35),
    // _ChartData(14, 125),
    // _ChartData(15, 150),
    // _ChartData(16, 73),
    // _ChartData(18, 35)
  ];
  @override
  void initState() {
    super.initState();
  }

  List<LineSeries<_ChartData, num>> _getDefaultLineSeries() {
    return <LineSeries<_ChartData, num>>[
      LineSeries<_ChartData, num>(
          dataSource: chartList,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          pointColorMapper: (_ChartData data, _) => AppColors.bgBtnColor,
          color: AppColors.bgBtnColor
          // markerSettings: const MarkerSettings(isVisible: true)
          )
    ];
  }

  List<LineSeries<_ChartData, String>> _getLineDaysZoneSeries() {
    return <LineSeries<_ChartData, String>>[
      LineSeries<_ChartData, String>(
          dataSource: weekList,
          xValueMapper: (_ChartData sales, _) => sales.x as String,
          yValueMapper: (_ChartData sales, _) => sales.y,
          pointColorMapper: (_ChartData data, _) => AppColors.bgBtnColor,
          color: AppColors.bgBtnColor
          // markerSettings: const MarkerSettings(isVisible: true)
          )
    ];
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
        return _getDefaultLineSeries();
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
      annotations: <CartesianChartAnnotation>[
        CartesianChartAnnotation(
            widget: Container(child: const Text('Text')),
            coordinateUnit: CoordinateUnit.point,
            x: 0, // x position of annotation
            y: 75 // y position of annotation
            ),
      ],
      title: ChartTitle(
          text: '(BPM)',
          alignment: ChartAlignment.near,
          textStyle: const TextStyle(color: Colors.white)),
      primaryXAxis: _getPrimaryXAxis(),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}',
          minimum: 0,
          maximum: 150,
          interval: 25,
          borderWidth: 0,
          labelStyle: const TextStyle(color: Colors.white),
          plotBands: [
            PlotBand(
                shouldRenderAboveSeries: false,
                start: 25,
                end: 50,
                color: Colors.green,
                opacity: 0.3),
            PlotBand(
                shouldRenderAboveSeries: false,
                start: 100,
                end: 125,
                color: Colors.red,
                opacity: 0.3),
          ]),
      series: _getSeries(),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final dynamic x;
  final dynamic y;
}
