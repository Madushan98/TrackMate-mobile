import 'dart:convert';

import 'package:covid_safe_app/configuration/app_config.dart';
import 'package:covid_safe_app/models/Auth/RegistrationModel.dart';
import 'package:covid_safe_app/service/Authentication/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../routes/appPages.dart';
import '../../screens/LoadingStatus.dart';
import '../baseController.dart';

class RegistrationController extends GetxController with BaseController {
  var isRegistering = false.obs;
  var nationalId = "".obs;
  var fullName = "".obs;
  var age = "".obs;
  var gender = "".obs;
  var password = "".obs;
  var confirmPassword = "".obs;
  var mobileNumber = "".obs;
  var _authService = Get.find<AuthService>();

  Future registerUser(BuildContext context) async {
    isRegistering.value = true;
    bool isSuccess = false;
    if (password.value != confirmPassword.value) {
      LoadingStatus.showErroDialog(
          description: "passwords does not match", context: context);
      isRegistering.value = false;
      update();
      return null ;
    }
    if (nationalId == "" || password == "" || fullName == "") {
      LoadingStatus.showErroDialog(
          description: "Enter required values", context: context);
      isRegistering.value = false;
      update();
      return null;
    }
    try {
      var registrationRequest = new RegistrationModel(
        nationalId: nationalId.value,
        fullName: fullName.value,
        primaryContactNumber: mobileNumber.value,
        password: password.value,
        age: age.value,
        gender: gender.value,
      );
      var payload = json.encode(registrationRequest);
      isSuccess = await _authService
          .registerUser(registrationRequest)
          .catchError((error) {
        handleError(error, context);
      });
    } catch (e) {}
    isRegistering.value = false;
    update();
    if (isSuccess) {
      Get.offAllNamed(Routes.HOME);
    }
  }
}
