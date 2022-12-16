import 'dart:ui';

import 'package:covid_safe_app/service/Authentication/AuthService.dart';
import 'package:get/get.dart';
import '../../service/Pass/PassService.dart';

class CreatePassController extends GetxController {
  var isLoading = false.obs;
  var _authService = Get.find<AuthService>();
  var nationalID = "".obs;
  var selectedOption = "".obs;
  var isReoucuring = "".obs;
  var startDate = "".obs;
  var endDate = "".obs;
  var typeOptions = RxList<String>();
  var intervalOptions = RxList<String>();

  @override
  void onInit() {
    addIntervalOptions();
    addTypeOptions();
    getUserDetails();
    super.onInit();
  }

  getUserDetails() async {
    var userDetails = await _authService.getUserDetails();
    nationalID.value = userDetails.nationalId!;
    update();
  }

  addIntervalOptions() {
    intervalOptions.add("Weekly");
    intervalOptions.add("One Time");
    intervalOptions.add("Daily");
    update();
  }

  addTypeOptions() {
    typeOptions.add("Employee");
    typeOptions.add("Emergency");
    typeOptions.add("Medical");
    update();
  }
}
