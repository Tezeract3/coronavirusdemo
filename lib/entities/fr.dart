// import 'dart:convert';

// import 'package:coronaliveupdate/apiCalls/LiveCovidUpdate.dart';
// import 'package:http/http.dart' as http;

// class GetCoronaDetails {
//   static Future<http.Response> _httpResponse(String country) async {
//     return http.get(Uri.parse('https://covid-19.dataflowkit.com/v1/$country'));
//   }

//   static getLiveCoronaUpdate(String countryName) async {
//     http.Response response = await _httpResponse(countryName);
//     if (response.statusCode == 200) {
//       return LiveCovidUpdate.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
// }
