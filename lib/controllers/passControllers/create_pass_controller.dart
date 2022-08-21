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
  var options = RxList<String>();

  @override
  void onInit() {
    addOptions();
    getUserDetails();
    super.onInit();
  }

  getUserDetails() async {
    var userDetails = await _authService.getUserDetails();
    nationalID.value = userDetails.nationalId!;
    update();
  }

  addOptions() {
    options.add("Employee");
    options.add("Emergency");
    options.add("Medical");
    update();
  }
}
