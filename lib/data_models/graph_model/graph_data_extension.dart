import 'package:ebhc/data_models/health_state.dart';

extension ListExtension<T> on List<HealthState> {
  List<HealthState> interval(Duration d) {
    List<HealthState> fiveMinuteList = [];
    List<HealthState> tempList = [];
    if (List<HealthState>.from(this).isNotEmpty) {
      // retrieves time of first object
      DateTime orignTime = DateTime.parse(List<HealthState>.from(this)[0].time);

      // take starttime not include minutes and second
      DateTime startTime = DateTime(orignTime.year, orignTime.month,
          orignTime.day, orignTime.hour, 00, 00);

      // retrieves time of last object and add 1 minutes
      DateTime endDate = DateTime.parse(List<HealthState>.from(this).last.time);

      for (DateTime time = startTime;
          time.isBefore(endDate.add(const Duration(minutes: 1)));
          time = time.add(d)) {
        tempList = [];
        // take 5 minutes time interval data as temporary list
        tempList = List<HealthState>.from(this).where((healthList) {
          return DateTime.parse(healthList.time)
                  .isAfter(time.subtract(const Duration(milliseconds: 1))) &&
              DateTime.parse(healthList.time).isBefore(time.add(d));
        }).toList();

        if (tempList.isNotEmpty) {
          // add the last data to real show list
          fiveMinuteList.add(tempList.last);
        }
      }
    }
    print("Graph Data List ############### ${fiveMinuteList.last}");
    // retun final list
    return fiveMinuteList;
  }
}
