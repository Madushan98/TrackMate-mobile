import 'dart:convert';
import 'package:covid_safe_app/configuration/app_config.dart';
import 'package:covid_safe_app/configuration/app_constants.dart';
import 'package:covid_safe_app/configuration/base_client.dart';
import 'package:covid_safe_app/models/Auth/LoginModel.dart';
import 'package:covid_safe_app/models/Auth/AuthModel.dart';
import 'package:covid_safe_app/models/Auth/RegistrationModel.dart';
import 'package:covid_safe_app/models/User/createVaccinationData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/state_manager.dart';

import '../../models/User/UserModel.dart';
import '../../models/User/VaccinationDetails.dart';

class AuthService extends GetxService {
  bool isAuthenticated = false;
  late AuthModel authDetails;

  Future<bool?> logIn(LoginModel loginRequest, BuildContext context) async {
    var response = await BaseClient().post(authUrl, "login", loginRequest);
    if (response != null) {
      print(response);
      final jsonData = jsonDecode(response);
      authDetails = AuthModel.fromJson(jsonData);
      var userDetails = authDetails.user;
      await setUserDetails(jsonEncode(userDetails));
      if (authDetails.token != null) {
       await setAuthToken(authDetails.token!);
        return true;
      }
      return false;
    }
    return false;
  }

  Future<bool> registerUser(RegistrationModel registrationRequest) async {
    var response =
        await BaseClient().post(authUrl, "register", registrationRequest);
    if (response != null) {
      final jsonData = jsonDecode(response);
      authDetails = AuthModel.fromJson(jsonData);
      var userDetails = authDetails.user;
      await setAuthToken(authDetails.token!);
      await setUserDetails(jsonEncode(userDetails));
      return true;
    }
    return false;
  }

  Future getUser() async {
    var response = await BaseClient().get(authUrl, "user");
    print(response);
  }


  Future<void> isTokenAvailable() async {
    final storage = new FlutterSecureStorage();
    var authToken = await storage.read(key: Constants.authToken.toString());
    if (authToken != null) {
      this.isAuthenticated = true;
    } else {
      this.isAuthenticated = false;
    }
  }

  Future<bool> LogOut() async {
    final storage = new FlutterSecureStorage();
    await storage.delete(key: Constants.authToken);
    return true;
  }

  Future<bool> setAuthToken(String token) async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: Constants.authToken, value: token);
    isAuthenticated = true;
    return isAuthenticated;
  }

  Future<void> setUserDetails(String userDetails) async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: Constants.userDetails, value: userDetails);
  }

  Future<User> getUserDetails() async {
    final storage = new FlutterSecureStorage();
    var data = await storage.read(key: Constants.userDetails);
    String jsonsDataString = data.toString();
    final jsonData = jsonDecode(jsonsDataString);
    User userDetails = User.fromJson(jsonData);
    return userDetails;
  }

  Future<User> reloadUserDetails() async {
    final storage = new FlutterSecureStorage();
    var data = await storage.read(key: Constants.userDetails);
    String jsonsDataString = data.toString();
    final jsonData = jsonDecode(jsonsDataString);
    User userDetails = User.fromJson(jsonData);
    var response = await BaseClient().get(userUrl, "user/" + userDetails.id!);
    if (response != null) {
      final jsonData = jsonDecode(response);
      User userDetails = User.fromJson(jsonData);
      await setUserDetails(jsonEncode(userDetails));
      return userDetails;
    }
    return User();
  }

  Future<bool>  updateVaccinationDetails(CreateVaccinationData createVaccinationData) async {
    var response = await BaseClient().put(userUrl, "user/vaccination-details", createVaccinationData);
    if (response != null) {
      final jsonData = jsonDecode(response);
      print(jsonData);
      return true ;
    }
    return false ;

  }

  Future<List<VaccinationDetails>> getVaccineData(String userId) async {
    var response = await BaseClient().get(userUrl, "user/vaccination-details/" + userId);
    if (response != null) {
      List<VaccinationDetails> vaccinationDetails = [];
      final jsonData = jsonDecode(response);
      print(jsonData);
      jsonData.forEach((v) {
        vaccinationDetails.add(VaccinationDetails.fromJson(v));
      });
      return vaccinationDetails ;
    }
    return [] ;
  }


}
