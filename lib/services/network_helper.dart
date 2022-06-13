import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkHelperService {
  final String apiUrl;
  NetworkHelperService({required this.apiUrl});
  final errorLogFile = 'errorFile.txt';

  Future getData() async {
    Response response = await http.get(Uri.parse(apiUrl));
    int statusCode = response.statusCode;

    if (statusCode == 200) {
      var apiData = response.body;
      print("API data from Network Helper class $apiData");
      File(errorLogFile)
          .writeAsString("API Data : $apiData")
          .onError<FileSystemException>((error, stackTrace) {
        return File.new('/errorFile.txt');
      });
      return jsonDecode(apiData);
    } else {
      var errorApiData = response.body;
      print("response error code : $statusCode /n"
          "response body : $errorApiData");
      return errorApiData;
    }
  }
}
