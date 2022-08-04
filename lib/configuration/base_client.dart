import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:covid_safe_app/configuration/auth_singleton.dart';
import 'app_exceptions.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  static const int TIME_OUT_DURATION = 20;
  //GET METHOD
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl + api);
    print(uri);
    try {
      var response = await AuthSingleton()
          .CustomHttpClient
          .get(uri)
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      print(response.statusCode);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST METHOD
  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    print(uri);
    var payload = json.encode(payloadObj);
    print(payload);
    try {
      var response = await AuthSingleton()
          .CustomHttpClient
          .post(uri, body: payload, encoding: Encoding.getByName("utf-8"),headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      })
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      print(response.statusCode);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //DELETE
  //OTHER

  dynamic _processResponse(http.Response response) {
    var responseUrl = response.request?.url.toString() ?? "";

    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 202:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes), responseUrl);
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), responseUrl);
      case 422:
        throw BadRequestException(utf8.decode(response.bodyBytes), responseUrl);
      case 500:
      default:
        throw FetchDataException(
            'Error occurred with code : ${response.statusCode}', responseUrl);
    }
  }
}
