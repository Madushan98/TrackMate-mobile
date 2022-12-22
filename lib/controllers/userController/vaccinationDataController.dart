import 'dart:ui';
import 'package:covid_safe_app/screens/LoadingStatus.dart';
import 'package:covid_safe_app/models/PassData/NewPassModel.dart';
import 'package:covid_safe_app/service/Authentication/AuthService.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../service/Pass/PassService.dart';

class VaccinationDataController extends GetxController {
  var isLoading = false.obs;
  var _authService = Get.find<AuthService>();
  var nationalID = "".obs;
  var userID = "".obs;
  var vaccinationType = RxList<String>();

  @override
  void onInit() {

    getUserDetails();
    super.onInit();
  }

  getUserDetails() async {
    var userDetails = await _authService.getUserDetails();
    nationalID.value = userDetails.nationalId!;
    userID.value = userDetails.id!;
    update();
  }

  addVaccinOptions() {

    update();
  }


}
