import 'dart:convert';

import 'package:http/http.dart' as http;

class getCoronaDetails {
  static var _apiData;
  static Future<http.Response> _httpResponse() async {
    return http.get(Uri.parse(""));
  }

  static convertData() async {
    http.Response response = await _httpResponse();
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      _apiData = data;
    } else {
      print(response.statusCode);
    }
  }
}
