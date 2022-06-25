import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_constants.dart';

class ApiClient {
  /// fetch data from the requests of type [Get]
  dynamic get(String path,
      {Map<dynamic, dynamic>? params = const {}, String token = ''}) async {
    final response = await http.get(
      Uri.parse(getPath(path, params: params)),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // fetch data successfully
      return json.decode(response.body);
    } else {
      // an exception happen while fetching data
      throw Exception(response.reasonPhrase);
    }
  }

  /// combines the Base Url with the end point and request params if they exist
  String getPath(String path, {Map<dynamic, dynamic>? params}) {
    var paramsString = '';
    if (params != null && params.isNotEmpty) {
      params.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }
    return '${ApiConstants.baseUrl}$path?$paramsString';
  }
}
