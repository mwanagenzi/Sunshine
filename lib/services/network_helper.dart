import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkHelper {
  final String apiUrl;
  NetworkHelper({required this.apiUrl});

  Future getData() async {
    Response response = await http.get(Uri.parse(apiUrl));
    int statusCode = response.statusCode;

    if (statusCode == 200) {
      var apiData = response.body;
      print(apiData);
      return jsonDecode(apiData);
    } else {
      var errorApiData = response.body;
      print("response error code : $statusCode /n"
          "response body : $errorApiData");
      return null;
    }
  }
}
