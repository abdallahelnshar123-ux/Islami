import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami1/model/pray_timings_response.dart';

class ApiManager {
  /*
  https://api.aladhan.com/v1/timingsByCity/16-07-2024?city=cairo&country=egypt
   */

  static Future<PrayTimingsResponse> getPraysTimes(String todayDate) async {
    Uri url = Uri.https('api.aladhan.com', '/v1/timingsByCity/$todayDate', {
      'city': 'cairo',
      'country': 'egypt',
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return PrayTimingsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
