import 'dart:convert';

import 'package:covid_safe_app/configuration/app_config.dart';
import 'package:covid_safe_app/configuration/app_constants.dart';
import 'package:covid_safe_app/configuration/base_client.dart';
import 'package:covid_safe_app/models/Auth/LoginModel.dart';
import 'package:covid_safe_app/models/Auth/AuthModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  bool isAuthenticated = false;

  Future<bool> logIn(LoginModel loginRequest, BuildContext context) async {
    var jsonBody = jsonEncode(loginRequest);

    var response = await BaseClient().post(userService, "login", loginRequest);
    if (response != null) {
      print(response);
      final jsonData = jsonDecode(response);
      var user = AuthModel.fromJson(jsonData);
      if (user.token != null) {
        setAuthToken(user.token!);
        return true;
      }

      return true;
    }
    return false;
  }

  Future getUser() async {
    var response = await BaseClient().get(userService, "user");
    print(response);
  }

  Future<void> isTokenAvailable() async {
    final prefs = await SharedPreferences.getInstance();
    var authToken = prefs.getString(Constants.authToken);

    if (authToken != null) {
      this.isAuthenticated = true;
    } else {
      this.isAuthenticated = false;
    }
  }

  Future<bool> LogOut() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(Constants.authToken);
  }

  Future<bool> setAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    isAuthenticated = true;
    return await prefs.setString(Constants.authToken, token);
  }
}
