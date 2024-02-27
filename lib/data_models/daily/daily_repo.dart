import 'dart:convert';

import 'package:ebhc/data_models/api/api_client.dart';
import 'package:ebhc/data_models/daily/daily_state.dart';
import 'package:ebhc/data_models/location_address/location_state.dart';
import 'package:ebhc/utils/app_constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

class DailyRepo {
  Future<DailyState> getDailyList(LocationState locationState) async {
    final queryParameter = {
      "geocode": "${locationState.lat},${locationState.lon}",
      "format": "json",
      "units": "s",
      "language": "ja-JP",
      "apiKey": "0b12d3ca197640d892d3ca1976a0d86c"
    };
    Response response =
        await ApiClient.getData(AppConstants.DAILY_URL, queryParameter);

    if (response.statusCode == 200) {
      final DailyState dailyState =
          DailyState.fromJson(jsonDecode(response.body));
      return dailyState;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final dailyProvider = Provider<DailyRepo>((ref) => DailyRepo());
