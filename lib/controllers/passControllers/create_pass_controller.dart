import 'dart:ui';
import 'package:covid_safe_app/screens/LoadingStatus.dart';
import 'package:covid_safe_app/models/PassData/NewPassModel.dart';
import 'package:covid_safe_app/service/Authentication/AuthService.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../service/Pass/PassService.dart';

class CreatePassController extends GetxController {
  var isLoading = false.obs;
  var _authService = Get.find<AuthService>();
  var nationalID = "".obs;
  var userID = "".obs;
  var selectedOption = "".obs;
  var isReoucuring = false.obs;
  var selectedInterval = "".obs;
  var organization = "".obs;
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
    userID.value = userDetails.id!;
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

  Future<void> createPass(BuildContext context) async {

    if (nationalID.value == "" ||
        selectedOption.value == "" ||
        startDate.value == "" ||
        endDate.value == "") {
      LoadingStatus.showErroDialog(
          description: "Please fill all the fields", context: context);
      return;
    }
    NewPassModel passModel = new NewPassModel(
        nationalId: nationalID.value,
        passCategory: selectedOption.value,
        isReoccurring: isReoucuring.value,
        startDateTime: startDate.value,
        endDateTime: endDate.value,
        userId: userID.value,
        to: "",
        from: "",
        data: []);
    print(passModel.toString());
    isLoading.value = true;
    print(isLoading.value);

    var _passService = Get.find<PassService>();
    bool success = await _passService.createPass(passModel);
    if (success) {
      isLoading.value = false;
      Get.back();
    } else {
      isLoading.value = false;
      LoadingStatus.showErroDialog(
          description: "Pass Creation Failed", context: context);
    }
    update();
  }
}
