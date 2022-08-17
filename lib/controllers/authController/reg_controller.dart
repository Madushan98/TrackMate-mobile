import 'dart:convert';

import 'package:covid_safe_app/configuration/app_config.dart';
import 'package:covid_safe_app/models/Auth/RegistrationModel.dart';
import 'package:covid_safe_app/service/Authentication/AuthService.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../routes/appPages.dart';

class RegistrationController extends GetxController {
  var isRegistering = false.obs;
  var nationalId = "".obs;
  var fullName = "".obs;
  var age = "".obs;
  var gender = "".obs;
  var password = "".obs;
  var confirmPassword = "".obs;
  var mobileNumber = "".obs;
  var _authService = Get.find<AuthService>();

  Future registerUser() async {
    isRegistering.value = true;
    var registrationRequest = new RegistrationModel(
      nationalId: nationalId.value,
      password: password.value,
      age: age.value,
      gender: gender.value,
    );
    print(registrationRequest);
    var payload = json.encode(registrationRequest);
    print(payload);
    bool isSuccess = await _authService.registerUser(registrationRequest);
    isRegistering.value = false;
    update();
    if (isSuccess) {
      Get.offAllNamed(Routes.HOME);
    }
  }
}
