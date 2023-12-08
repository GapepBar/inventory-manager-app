import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';

final authApiService = Provider((ref) => APIServiceCategory());

class APIServiceCategory {
  static var client = http.Client();

  Future<String> login(Map<String, String> mp) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur =
        "${Config.apiURL}${Config.LoginAPI}";
    var url = Uri.parse(ur);

    // var response = await client.get(
    //   url,
    //   headers: requestHeaders,
    // );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
          {'userId': mp['userid'], 'password': mp['password']}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data['data'];
    } else {
      return "null";
    }
  }
}
